-- Create test table with required columns
create table if not exists public.test (
  id uuid primary key default uuid_generate_v4(),
  name text not null check (char_length(name) <= 255),
  value text not null check (char_length(value) <= 1000),
  user_id uuid references auth.users(id) on delete cascade not null,
  created_at timestamp with time zone default now() not null,
  updated_at timestamp with time zone default now() not null
);

comment on table public.test is 'User-specific test data storage';

-- Add automatic user_id assignment trigger
create or replace function public.set_test_user_id()
returns trigger as $$
begin
  new.user_id = auth.uid();
  return new;
end;
$$ language plpgsql security definer;

create trigger handle_test_user_id
before insert on public.test
for each row execute procedure public.set_test_user_id();

-- Add timestamp management
create extension if not exists moddatetime schema extensions;

create trigger handle_test_updated_at
before update on public.test
for each row execute procedure moddatetime(updated_at);

-- Enable Row Level Security
alter table public.test enable row level security;

-- Create access policies
create policy "Users can create their own tests" on public.test
  for insert with check (
    auth.role() = 'authenticated' and
    user_id = auth.uid()
  );

create policy "Users can update their own tests" on public.test
  for update using (
    auth.uid() = user_id
  ) with check (
    auth.uid() = user_id
  );

create policy "Users can read their own tests" on public.test
  for select using (
    auth.uid() = user_id
  );

-- Enable Realtime updates
alter publication supabase_realtime add table public.test;