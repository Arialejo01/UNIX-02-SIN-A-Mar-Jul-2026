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

# --- Level 14: Filtering Input (grep) ---

# The grep command is a text filter that searches lines in an input
# and returns those that match a given pattern.
# Basic syntax: grep [OPTIONS] PATTERN [FILE]

# Change to the Documents directory
cd ~/Documents

# (Assuming /etc/passwd was copied in a previous step)
cp /etc/passwd .

# The passwd file contains details of system accounts and users.
# We can use grep to filter and get information about a specific user (sysadmin).
# 'sysadmin' is the pattern argument, and 'passwd' is the file argument.
grep sysadmin passwd

# --- Regular Expressions (Regex) ---
# Regular expressions have two common forms: basic and extended.
# Most commands that use regex can interpret basic regex. Extended regex 
# typically requires a command option (like grep -E or egrep) to work.

# Basic Regex Characters:
# .    -> Any single character
# [ ]  -> Any specified character within the brackets
# [^]  -> Any character NOT specified within the brackets
# *    -> Zero or more of the preceding character
# ^    -> Start of the line (if it's the first character of the pattern)
# $    -> End of the line (if it's the last character of the pattern)

# Extended Regex Characters (used with egrep or grep -E):
# +    -> One or more of the preceding pattern
# ?    -> The pattern is optional
# { }  -> Specify minimum, maximum, or exact matches
# |    -> Alternation - logical "or"
# ( )  -> Used to create groups

# --- Basic Patterns: Anchors ---
# It is recommended to enclose patterns in single quotes to prevent 
# the shell from misinterpreting special characters.

# The pattern 'root' appears many times in the /etc/passwd file:
grep 'root' passwd

# The anchor ^ indicates the pattern must appear at the BEGINNING of the line.
grep '^root' /etc/passwd

# Let's examine the alpha-first.txt file:
cat alpha-first.txt

# The anchor $ indicates the pattern must appear at the END of the line.
# Find lines that end with 'r':
grep 'r$' alpha-first.txt
# Note: The $ must be the last character in the pattern to act as an anchor.

# --- Matching Characters Using . (Dot) ---
# The . character represents any single character except a newline.

# Examine the red.txt file:
cat red.txt

# Find any line with 'r', followed by exactly two characters, ending with 'f':
grep 'r..f' red.txt

# Find four-letter words starting with 'r' and ending with 'd':
grep 'r..d' red.txt

# Find all lines containing a sequence of at least four characters:
grep '....' red.txt

# The line just has to contain the pattern, it doesn't have to be an exact match:
grep 'r..t' /etc/passwd

# --- Finding a Single Character Using [] ---
# Brackets [] are used to indicate single characters or ranges.

# Examine the profile.txt file:
cat profile.txt

# Find all lines containing a number (0 through 9):
grep '[0-9]' profile.txt

# Insert a ^ as the first character INSIDE brackets to negate. 
# This finds lines containing non-numeric characters:
grep '[^0-9]' profile.txt
# Note: This means lines containing non-numbers, not lines without numbers.

# If special characters are placed inside brackets, they are treated literally. 
# This only finds lines containing a literal period (.):
grep '[.]' profile.txt

# --- Repeating Characters Using * ---
# The * indicates the absence (zero) or presence (one or more) 
# of the preceding character or pattern.

# Find 'r', followed by zero or more 'e's, ending with 'd'
# Matches: red, reeed, rd, reed
grep 're*d' red.txt

# You can combine [] and *. This matches zero or more 'o' or 'e':
grep 'r[oe]*d' red.txt

# Used alone with a single character, * is not very useful because 
# it can mean ZERO occurrences, effectively matching every line:
grep 'z*' red.txt
grep 'e*' red.txt

# To make it useful, include something else. This matches at least one 'e':
grep 'ee*' red.txt

# --- Standard Input ---
# If no filename is provided, grep will act on standard input (your keyboard).
# It becomes interactive: you type, and grep filters as you go.
# Press Ctrl+D when you are ready to return to the prompt.

# Return to home directory
cd ~

# --- Fun Fact ---
# Linux is open source. This makes it extremely versatile!

