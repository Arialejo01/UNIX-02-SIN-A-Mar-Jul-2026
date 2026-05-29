# --- Level 12: Moving Files (mv) ---

# The mv command is used to move a file from one location in the file system to another.
# Basic syntax: mv SOURCE DESTINATION
# It requires at least two arguments: 
# 1. Source: the path to the file that will be moved.
# 2. Destination: the path to the location where the file will be moved.

# Change to the Documents directory
cd ~/Documents

# Move a file to an existing directory
# The filename is used as the source and the directory as the destination.
# If a new name is not specified, the file will keep its original name.
mv people.csv Work

# Confirm the move by listing the contents of the destination directory
ls Work

# Move multiple files at once
# You can specify multiple source files, as long as 
# the final argument provided is the destination directory.
mv numbers.txt letters.txt alpha.txt School

# Confirm that the multiple files were moved correctly
ls School

# Renaming files
# Moving a file within the same directory while specifying a new name 
# is the standard way to rename a file in Linux.
mv animals.txt zoo.txt

# Confirm the name change
ls

# --- Good to Know: Permissions ---
# Permissions can affect file management commands like mv. 
# Moving a file requires having write and execute permissions on both 
# the source directory and the destination directory.

# --- Fun Fact: Penguins in Space! ---
# NASA uses Linux. The International Space Station runs on Linux. 
# "We migrated key functions from Windows to Linux because we needed an 
# operating system that was stable and reliable." - Keith Chuvala, manager of 
# Space Operations Computing for NASA. 
# Curiosity, the Mars Rover, also uses it.

# --- Level 13: Removing Files (rm) ---

# The rm (remove) command is used to delete files and directories.
# It is important to note that deleted files and directories do not go to a 
# "trash bin" like they do in desktop-oriented operating systems.
# When a file is deleted with the rm command, it is generally gone permanently.
# Basic syntax: rm [OPTIONS] FILE

# Change to the Documents directory
cd ~/Documents

# Without any options, the rm command is typically used to remove ordinary files
rm linux.txt

# Verify the deletion
# This should return an error: "ls: cannot access linux.txt: No such file or directory"
ls linux.txt

# The rm command will ignore directories if you try to delete them without options
# This will fail and return: "rm: cannot remove 'Work': Is a directory"
rm Work

# To delete a directory, you must use a recursive option, such as -r or -R.
# Be careful, as these options are "recursive" and will delete the directory 
# along with all of its files and subdirectories inside it.
rm -r Work

# Verify the directory deletion
# This should return an error: "ls: cannot access Work: No such file or directory"
ls Work

# --- Warning ---
# The rm command deletes files permanently. If you are practicing in a lab 
# environment, you might need to reset the terminal to bring these files back.

# --- Good to Know: Permissions ---
# Permissions can affect file management commands, such as the rm command.
# To delete a file inside a directory, the user must have write and execute 
# permissions on that specific directory. Normally, ordinary users only have 
# this type of permission in their home directory and its subdirectories.