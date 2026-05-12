umask
# Displays the current file creation mask to verify the default system permissions.

touch archivo1
# Creates an empty file named archivo1 to evaluate the initial configuration of default permissions.

mkdir directorio1
# Generates a new directory named directorio1 to check the default assigned permissions.

ls -l
# Lists files and directories in long format to audit owners and permission bits.

umask 027
# Modifies the mask to 027, setting permissions to 640 (rw-r-----) for new files and 750 (rwxr-x---) for directories.

touch archivo2
# Creates a second test file to verify the correct application of the new 027 mask.

mkdir diretorio2
# Generates a second test directory to confirm the activation of permission restrictions.

sudo apt-get update
# Synchronizes the local package index with remote repositories using superuser privileges.

apt-get update
# Attempts to update the package list (an operation that typically requires administrator permissions to execute successfully).

apt-get upgrade
# Installs the most recent available versions for all currently installed software packages.

apt-get install acl
# Downloads and installs the Access Control List (ACL) utility for granular permission management.

chown -R $(whoami) .
# Recursively changes the owner of the current directory and all its content, assigning it to the active user.

setfacl -bnR .
# Recursively removes all extended ACL entries to restore standard UNIX permissions.

umask 027
# Resets the creation mask to 027 to ensure the continuity of the security policy.

ls -l
# Executes a secondary review to verify the cleanup of ACLs and the assignment of owners.