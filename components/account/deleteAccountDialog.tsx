import { deleteUserAccount } from '@/app/(actions)/auth';
import { Button } from '@/components/ui/button';
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import { toast } from 'sonner';

export default function DeleteAccountDialog() {
  const [isOpen, setIsOpen] = useState(false);
  const [confirmText, setConfirmText] = useState('');
  const router = useRouter();

  const handleDeleteAccount = async () => {
    if (confirmText.toLowerCase() !== 'delete my account') {
      toast.error("Please type 'delete my account' to confirm.");
      return;
    }

    let a = 1;

    try {
      // TODO: Implement actual account deletion logic here
      console.log('Deleting account...');
      let { data, error } = await deleteUserAccount();
      console.log('deleteUserAccount data', data);
      console.log('deleteUserAccount error', error);
      if (error) {
        throw error;
      }
      toast.success('Your account has been successfully deleted.');
      setIsOpen(false);
      router.refresh();

      // Redirect to home page or login page after successful deletion
    } catch (error) {
      console.error('Error deleting account:', error);
      toast.error(
        'An error occurred while deleting your account. Please try again.'
      );
    }
  };

  return (
    <Dialog open={isOpen} onOpenChange={setIsOpen}>
      <DialogTrigger asChild>
        <Button variant="destructive">Remove My Account</Button>
      </DialogTrigger>
      <DialogContent title="delete account" className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle>Delete Account</DialogTitle>
          <DialogDescription>
            This action cannot be undone. This will permanently delete your
            account and remove your data from our servers.
          </DialogDescription>
        </DialogHeader>
        <div className="grid gap-4 py-4">
          <Label htmlFor="confirm-delete" className="text-left">
            Type &apos;delete my account&apos; to confirm:
          </Label>
          <Input
            id="confirm-delete"
            value={confirmText}
            onChange={(e) => setConfirmText(e.target.value)}
            className="col-span-3"
          />
        </div>
        <DialogFooter>
          <Button variant="outline" onClick={() => setIsOpen(false)}>
            Cancel
          </Button>
          <Button variant="destructive" onClick={handleDeleteAccount}>
            Delete Account
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
