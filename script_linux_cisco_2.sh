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

