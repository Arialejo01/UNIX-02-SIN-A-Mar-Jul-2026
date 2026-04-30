# --- Level 2.1: Basic Command Syntax ---

# The 'ls' command lists information about files in the current directory.
# By default, it shows the contents of the current folder.
ls

# Example of Case Sensitivity:
# The following would fail because Linux is case-sensitive.
# LS

# Listing the contents of a specific directory (Documents)
# Note: Linux is case-sensitive, so we use a capital 'D'
ls Documents
# --- Level 2.2: Command Options (Flags) ---

# Use the -l option to display the "long" format (more details)
ls -l

# Use the -r option to reverse the alphabetical order of the output
ls -r

# Combine options to get a long listing in reverse order
# All these are equivalent: ls -l -r / ls -lr / ls -rl
ls -lr

# Easter Egg: The 'aptitude moo' command
# Options like -v (verbose) change the response of the program
aptitude moo
aptitude -v moo
aptitude -vv moo

# --- Level 3: Navigation - Print Working Directory ---

# Display the current location in the file system
pwd

# Note: The '~' symbol in the prompt represents the user's home directory (/home/sysadmin)

# --- Level 4: Navigation - Changing Directories (cd) ---

# Navigate to the Documents directory using a relative path
cd Documents

# Move to the system root directory (Absolute path)
cd /

# Return to the sysadmin home directory using its absolute path
cd /home/sysadmin

# Navigate to a nested directory using a relative path
# First, ensure you are in the correct starting point
cd ~
# Creating the structure if it doesn't exist for the example (Optional for the script)
mkdir -p Documents/School/Art 
cd Documents/School/Art

# Use shortcuts to navigate:
# Move up one level to the 'School' directory
cd ..

# Quickly return to the home directory from anywhere
cd ~

# Confirming the final position
pwd

# --- Level 5: File Listings and Metadata ---

# Long listing of the /var/log directory to see file details
ls -l /var/log

# Sort files by modification time (newest first)
ls -lt /var/log

# Sort files by size (largest first)
ls -lS /var/log

# Reverse the sorting order (e.g., smallest files first)
ls -lSr /var/log

# List directory contents in reverse alphabetical order
ls -r

# --- Level 6: Administrative Access (su and sudo) ---

# 1. Attempting to run a restricted command as a normal user
# This will return "Permission denied"
sl

# 2. Using 'su' (Substitute User)
# 'su' alone opens a shell as root by default
su

# 3. Using 'su' with a login shell (Recommended)
# These three commands are equivalent:
su -
su -l
su --login

# 4. Returning to the original user
# Use 'exit' to close the administrative shell and return to 'sysadmin'
exit

# 5. Using 'sudo' (Superuser Do)
# Executes a single command with root privileges safely
sudo sl

# 6. Using 'sudo' to run a command as a different specific user
# The -u option allows you to specify the target account
sudo -u sysadmin sl

# --- Level 7: Permissions ---

# Navigate to the Documents directory using the home shortcut (~)
cd ~/Documents

# Display detailed information (long listing) for the 'hello.sh' file
# This shows the 10-character permission string (e.g., -rw-r--r--)
ls -l hello.sh

# Note: The first character indicates the file type:
# '-' = Ordinary file
# 'd' = Directory
# 'l' = Symbolic link

# The permission groups are: [User][Group][Others]
# Example: -rw-r--r-- means:
# User: Read & Write (rw-)
# Group: Read only (r--)
# Others: Read only (r--)
# --- Level 8: Changing Permissions (chmod) ---

# Navigate to the Documents directory
cd ~/Documents

# Try to execute the script without execute permissions
# This should result in a "Permission denied" error
./hello.sh

# Add execute permission (x) to the owner (u) of the file
chmod u+x hello.sh

# List the file to verify the new permissions (now showing -rwxr--r--)
ls -l hello.sh

# Execute the script now that it has the correct permissions
./hello.sh

# Additional examples of symbolic chmod:
# Add write permission to the group
chmod g+w hello.sh

# Remove read permission from others
chmod o-r hello.sh

# Give everyone execute permission
chmod a+x hello.sh
# --- Level 9: Changing Ownership (chown) ---

# Navigate to the Documents directory
cd ~/Documents

# List all files to check the current owner (should be 'sysadmin')
ls -l

# Change the owner of 'hello.sh' from 'sysadmin' to 'root'
# Administrative privileges (sudo) are required for this action
sudo chown root hello.sh

# Verify the change in ownership
# The 3rd column of 'ls -l' should now show 'root'
ls -l hello.sh

# Try to execute the script as 'sysadmin'
# This will fail (Permission denied) because 'sysadmin' is no longer the owner
./hello.sh

# Execute the script using 'sudo'
# This works because it runs the command with root privileges
sudo ./hello.sh