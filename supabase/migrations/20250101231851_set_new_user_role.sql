-- Create function to set default role for new users
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
  INSERT INTO public.user_roles (user_id, role)
  VALUES (NEW.id, 'user');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger to call function on user insert
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


-- Create a new storage bucket for user avatars with better defaults
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'user_avatars',
  'user_avatars',
  false,
  26214400, -- 5MB limit
  array['image/jpeg', 'image/png', 'image/webp']
);




-- Enable RLS
alter table storage.objects enable row level security;

-- Create policy to allow users to view their own avatar
create policy "Users can view their own avatar" on storage.objects for select
using (
  bucket_id = 'user_avatars' 
  and auth.uid()::text = (storage.foldername(name))[1]
);

-- Create policy to allow users to upload their own avatar
create policy "Users can upload their own avatar" on storage.objects for insert
with check (
  bucket_id = 'user_avatars'
  and auth.uid()::text = (storage.foldername(name))[1]
);

-- Create policy to allow users to update their own avatar
create policy "Users can update their own avatar" on storage.objects for update
using (
  bucket_id = 'user_avatars'
  and auth.uid()::text = (storage.foldername(name))[1]
);

-- Create policy to allow users to delete their own avatar
create policy "Users can delete their own avatar" on storage.objects for delete
using (
  bucket_id = 'user_avatars'
  and auth.uid()::text = (storage.foldername(name))[1]
);

-- Improve the delete_old_avatar function with better error handling
create or replace function delete_old_avatar()
returns trigger as $$
declare
  old_avatar_path text;
begin
  -- Validate input
  if NEW.bucket_id != 'user_avatars' then
    return NEW;
  end if;

  -- Find the old avatar for this user
  select name into old_avatar_path 
  from storage.objects
  where bucket_id = 'user_avatars'
  and (storage.foldername(name))[1] = (storage.foldername(NEW.name))[1]  -- Match the folder
  and name != NEW.name  -- Don't delete the new file
  and created_at < NEW.created_at;  -- Only delete older files

  -- If found, delete it
  if old_avatar_path is not null then
    delete from storage.objects 
    where name = old_avatar_path;
  end if;

  return NEW;
exception
  when others then
    -- Log error but don't block the upload
    raise warning 'Error in delete_old_avatar: %', SQLERRM;
    return NEW;
end;
$$ language plpgsql security definer;

drop trigger if exists on_avatar_upload on storage.objects;


-- Create trigger to run function on avatar upload
create trigger on_avatar_upload
  after insert or update on storage.objects
  for each row
  when (NEW.bucket_id = 'user_avatars')
  execute function delete_old_avatar();



-- Improve the delete_user_avatars function with better error handling
create or replace function delete_user_avatars()
returns trigger as $$
declare
  deleted_count int;
begin
  -- Delete all files in the user's folder
  with deleted as (
    delete from storage.objects 
    where bucket_id = 'user_avatars'
    and (storage.foldername(name))[1] = OLD.id::text
    returning *
  )
  select count(*) into deleted_count from deleted;

  -- Log the number of files deleted
  raise notice 'Deleted % avatar files for user %', deleted_count, OLD.id;
  
  return OLD;
exception
  when others then
    -- Log error but don't block the user deletion
    raise warning 'Error in delete_user_avatars: %', SQLERRM;
    return OLD;
end;
$$ language plpgsql security definer;

-- Create trigger to run function when user is deleted
create trigger on_user_delete
  after delete on auth.users
  for each row
  execute function delete_user_avatars();