mkdir #Creates a new directory (though it requires a folder name to work)
cd proyecto/ #Changes the current directory to the "proyecto" subdirectory
cd .. #Moves the current directory up one level to the parent directory
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto #Changes the current directory to the specific absolute path provided
cd #Changes the current directory to the current user's home directory
cd ~ #Changes the current directory to the home directory using the tilde (~) shortcut
cd $HOME #Changes the current directory to the home directory using the $HOME environment variable
cd /home/codespace/ #Changes the current directory to the specific absolute path /home/codespace/
cd /usr/local/ #Changes the current directory to the specific absolute path /usr/local/
ls -lai #Lists all files (including hidden ones) in a detailed long format and displays their inode numbers
ls -l -a -i #Performs the exact same function as ls -lai, just writing the option flags separately
ls -all #Lists all files including hidden ones in long format (the system reads the single dash as combined -a and -l flags)
. #is the current directory
.. #es el directorio padre
@Arialejo01 ➜ /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto (boot) $ ls -lai
total 8
1572970 drwxrwxrwx+ 2 codespace codespace 4096 Apr  9 12:19 .
1572874 drwxrwxrwx+ 5 codespace root      4096 Apr  9 12:19 ..
# These lines give you the detailed breakdown of the current directory (.) and the parent directory (..). Here is what each column means, reading from left to right:
#1572970 / 1572874: The inode number (the unique system ID for that specific folder).
#drwxrwxrwx+: The file type and permissions.
#The d means it is a directory.
#The rwx repetitions mean the owner, group, and other users all have read, write, and execute permissions.
#The + at the end means there are extra, extended security permissions (Access Control Lists) applied to it.
#2 / 5: The number of hard links pointing to this directory.
#codespace: The user who owns the directory.
#codespace / root: The group that owns the directory.
#4096: The size of the directory's metadata in bytes.
#Apr 9 12:19: The date and time the directory was last modified.
#. / ..: The name of the directory (. representing "here" and .. representing "one level up").

stat . #Displays highly detailed system metadata and status information (like exact timestamps, permissions, and device location) for the current directory.
Device: 7,4 #indicates the specific physical or virtual storage drive (major ID 7, minor ID 4) where your current directory is saved

ls -lt #Lists files in a detailed long format, sorted by modification time with the newest files appearing first
whoami #Displays the username of the currently logged-in user
pwd #Prints the full absolute path of your current working directory (Print Working Directory)
ls /etc | head -20 #Lists the contents of the /etc directory and uses a pipe (|) to display only the first 20 lines of the output
ls /dev | tail -20 #Lists the contents of the /dev directory and uses a pipe (|) to display only the last 20 lines of the output
