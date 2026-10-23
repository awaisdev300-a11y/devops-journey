File permission failure

Initial permissions:000

Final permissions:644


What broke?

The test file had no read, write, or execute permission bits.

How was it diagnosed?

ls -l showed ----------, and cat returned Permission denied.

Root cause

The permissions were deliberately removed using chmod 000.

How was it fixed?

Ran chmod 644 to restore read and write access for the owner and read access for the group and others.

How was the fix verified?

ls -l displayed the expected permissions, and cat successfully displayed the file contents.
