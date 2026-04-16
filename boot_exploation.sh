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