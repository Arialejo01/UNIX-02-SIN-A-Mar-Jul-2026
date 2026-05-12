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
umask 022
# Sets the default file creation mask to 022, resulting in permissions of 644 (rw-r--r--) for new files and 755 (rwxr-xr-x) for directories.

whoami
# Displays the username of the currently logged-in user to verify the active account.

echo "Hola" > mi_archivo
# Creates a new file named mi_archivo (or overwrites it if it exists) and writes the string "Hola" into it.

ls -l mi_archivo
# Lists the detailed properties in long format specifically for mi_archivo to check its permissions and owner.

ls -l
# Lists all files and directories in the current location in long format to audit the workspace.

useradd -m -s /usr/bin/zsh luna
# Creates a new user account named 'luna', generates a home directory for them (-m), and sets their default shell to zsh (-s).

chown luna mi_archivo
# Changes the ownership of the file mi_archivo, assigning it to the newly created user 'luna'.

ls -l
# Executes another long format listing to verify that the ownership change for mi_archivo was successful.
groups
# Displays the group memberships for the currently logged-in user to see which groups they belong to.

groupadd grupo_test
# Creates a new system group named 'grupo_test' for managing user permissions collectively.

groups
# Displays the group memberships again to verify the current user's groups.

touch comun
# Creates an empty

groups
# Displays the groups that the currently logged-in user belongs to.

groupadd grupo_test
# Creates a new user group named 'grupo_test' on the system.

groups
# Re-evaluates and displays the current user's group memberships.

touch comun
# Creates an empty file named 'comun' to evaluate its default permissions and group ownership.

ls -l comun
# Lists the detailed properties in long format specifically for the file 'comun'.

cat /etc/group
# Outputs the contents of the system's group file to verify the creation and details of all groups, including 'grupo_test'.