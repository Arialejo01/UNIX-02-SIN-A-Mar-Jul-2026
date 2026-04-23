#Lists all files (including hidden ones) in a detailed, long format with human-readable file sizes.
ls -l -a -h
#Performs the exact same action as the previous command, just combining the flags into one argument.
ls -lah
#Creates a directory literally named -rf, using -- to signal the end of options so it isn't treated as a flag.
mkdir -- -rf
#Removes an empty directory literally named -rf, again using -- to prevent it from being read as a command flag.
rmdir -- -rf
#Creates a shallow Git clone by limiting the downloaded commit history to the specified number of recent commits.
--depth <depth>
   Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the histories near the tips of all branches. If
   you want to clone submodules shallowly, also pass --shallow-submodules.
#Grants execute permission to everyone (the owner, the group, and all other users) for the file script.sh.
chmod +x script.sh
#Grants execute permission exclusively to the user who owns the file script.sh.
chmod u+x script.sh
#Removes read permission from "others" (users who are neither the owner nor part of the file's group) for secreto.txt.
chmod o-r secreto.txt
#Grants read and write permissions to the owner, while completely revoking read, write, and execute permissions for both the group and others on privado.
chmod u+rw,go-rwx privado
#Attempts to write "hola" to a protected file but fails with a permission error because the redirection (>) is executed by your normal user, not by sudo.
sudo echo "hola" > /etc/archivo_protegio
#Successfully writes "hola" to a protected file using root privileges, completely hiding the output from your terminal screen.
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null
#Successfully writes "hola" to a protected file using root privileges and simultaneously prints "hola" back to your terminal screen.
echo "hola" | sudo tee /etc/archivo_protegido
#This command appends the string "chao" to a system-protected file named /etc/archivo_protegido using root privileges.
sudo sh -c 'echo "chao" >> /etc/archivo_protegido'
#This command displays the content of the file `/etc/archivo_protegido` in your terminal.
cat /etc/archivo_protegido
#Opens a login shell as the root user, fully loading the root environment and setting the directory to root's home.
sudo -i
#Closes the current terminal session or logs you out of the currently active user shell.
exit
#Switches you to the root user account but generally retains your original user's environment variables.
sudo su
#Switches to the root user (or a specified user) and simulates a full login to load their specific environment.
su -
#Lists all local branches in your current Git repository and highlights the one you are currently working on.
git branch
#Prints the actual path to your home directory because double quotes allow the $HOME environment variable to expand.
echo "$HOME"
#Prints the literal text "$HOME" because single quotes treat everything as raw text and prevent variable expansion.
echo '$HOME'
#Creates or overwrites hola.sh by inserting the shebang #!/bin/sh to define the shell interpreter.
echo '#!/bin/sh' > hola.sh
#Appends an echo command to the end of the hola.sh file without overwriting the existing content.
echo 'echo "Hola desde mi primer script"' >> hola.sh
#Outputs the full contents of the hola.sh file to the terminal screen.
cat hola.sh
#Attempts to run the script in the current directory, which will initially fail due to missing execute permissions.
./hola.sh
#Displays detailed file information for hola.sh, allowing you to see its current read/write/execute permissions.
ls -l hola.sh
#Adds execute permissions to the hola.sh file, making it a runnable program.
chmod +x hola.sh
#Displays the file details again to verify that the execute permissions have been successfully added.
ls -l hola.sh
#Successfully runs the script, outputting the text "Hola desde mi primer script" to the terminal.
./hola.sh
