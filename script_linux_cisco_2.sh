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

# --- Level 15: Shutting Down (shutdown) ---

# The shutdown command prepares the system for a safe system shutdown.
# All logged-in users are notified that the system is going down, and new 
# logins are prevented in the five minutes prior to a full system shutdown.
# Basic syntax: shutdown [OPTIONS] TIME [MESSAGE]

# The shutdown command requires administrative access.
# Switch to the root account for this section using the following command.
# (If prompted for a password in your lab, use 'netlab123')
su -

# --- Note for Lab Environments ---
# In virtual lab environments, the machines often won't actually shut down! 
# Use the command, but be aware that instead of powering off, you will simply 
# return to the command line. You might need to press Enter or Ctrl+C to get 
# the prompt back.
shutdown now

# --- Time Arguments ---
# Unlike other commands used to halt the system, the shutdown command 
# requires a time argument to specify when the shutdown should begin. 
# The formats for this time argument can be:
# 1. 'now' (immediately)
# 2. A specific time of day in 'hh:mm' format
# 3. A delay in minutes using the '+minutes' format

# --- Think About This: System Time ---
# Your system clock might be configured to a different time zone than yours. 
# To verify the terminal time, use the date command. 
# The default output format is: weekday month day hour:minute:second UTC year
# (The 'UTC' indicates the time is displayed in Coordinated Universal Time).
date

# Schedule a shutdown at a specific time (e.g., 01:51)
# Note: If practicing, check your 'date' output first and set this 1-2 minutes ahead.
shutdown 01:51

# --- Adding a Broadcast Message ---
# The shutdown command also has the option to add a message as an argument. 
# This message will appear on the terminals of all logged-in users.
# For example, to schedule a shutdown in 1 minute with a custom message:
shutdown +1 "Goodbye World!"

# (Optional) Exit the root shell to return to your normal user account
exit

# --- Level 16: Network Configuration (ifconfig and ping) ---

# The ifconfig command stands for "interface configuration" and is used 
# to display information about the network configuration.
# Basic syntax: ifconfig [OPTIONS] 
# Note: The iwconfig command is similar, but it refers to wireless network interfaces.

# Run ifconfig to see the current network interfaces
ifconfig

# --- Think About This: Network Interfaces ---
# While not all network configurations are important for this module, 
# you should look for a few key details in the output:
# 1. 'eth0' is typically the primary network device. Its IPv4 address (inet addr) 
#    might be something like 192.168.1.2, and its status will show as active (UP).
# 2. 'lo' is known as the loopback device. It is a special network device 
#    used by the system when it needs to send network-based data to itself 
#    (e.g., 127.0.0.1).

# Note: The ifconfig command can also be used to temporarily modify network 
# configurations. However, since these changes usually need to be permanent, 
# it is rarely used for that purpose nowadays.

# --- Testing Connectivity (ping) ---
# The ping command is used to verify connectivity between two computers. 
# It sends "packets" (encapsulated units of data sent over a network) to 
# another machine. Receiving a reply indicates that it is possible to connect.
# Ping uses IP addresses or hostnames to identify the target machine.

# By default, ping will send packets continuously until you interrupt it 
# with the break command (Ctrl+C). 
# To limit the number of pings, use the -c option followed by the count.

# Example of a successful ping (sending exactly 4 packets):
ping -c 4 192.168.1.2

# If the ping fails, you will receive a message indicating that the target 
# machine could not be found (Destination Host Unreachable):
ping -c 4 192.168.1.3

# --- Good to Know: Firewalls and Hostnames ---
# A ping command might fail even if the remote machine is connected to the network. 
# As a security measure, some administrators configure their computers, or even 
# entire networks, to not respond to ping requests.
# 
# Ping also works with hostnames or domain names (like yahoo.com). Doing this 
# first can save time: if a hostname ping succeeds, it proves that proper name 
# resolution (DNS) is working AND that network routing is functioning correctly.

# Exit the root account and return to the normal user prompt
exit

# --- Level 17: Viewing Processes (ps) ---

# Executing a command results in something called a process. 
# In the Linux operating system, processes run based on the privileges 
# of the user running the command. 

# Generally, regular users (like sysadmin) cannot control another user's processes. 
# Users with administrative privileges (like root) can control any process 
# from any user, including stopping them.

# The ps command is used to list processes.
# Basic syntax: ps [OPTIONS]

# By default, the ps command will show the processes running in the current terminal.
ps

# --- Understanding the Output ---
# PID: Process Identifier. A unique number for each process. This is very useful 
#      when you need to control or stop a process using its ID.
# TTY: The name of the terminal where the process is running. Helps distinguish 
#      between different processes that share the same name.
# TIME: The total amount of CPU processing time used by a given process.
# CMD: The command that started the process.

# Instead of seeing only the processes in the current terminal, 
# you can use the -e option to display ALL processes running on the system:
ps -e

# You can use the -f (full) option to provide a more detailed output.
# This adds