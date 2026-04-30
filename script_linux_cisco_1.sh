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