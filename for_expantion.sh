#!/bin/bash
# Starts a 'for' loop that looks for any file (or folder) in the current directory 
# that starts with "example_file" (the '*' is a wildcard). 
# It assigns each matching name to the variable 'file', one by one.
for file in example_file*; do

  # Checks if the current file being processed is exactly named "example_file1".
  if [[ "${file}" == "example_file1" ]]; then
    
    # If it is "example_file1", it prints this message.
    echo "Skipping the first file"
    
    # The 'continue' command immediately skips the rest of the code in this loop 
    # and jumps back to the top to process the next file in the list.
    continue
  fi
  
  # Generates a random integer using the built-in Bash variable '$RANDOM' 
  # and writes it into the current file. 
  # The '>' operator overwrites the file, meaning any previous content is deleted.
  echo "${RANDOM}" > "${file}"

# Closes the for loop.
done

# ==========================================
# KEY CONCEPTS EXPLANATION:
# ==========================================
# 1. 'continue': This is a very useful loop control command. While 'break' would 
# completely destroy and exit the loop, 'continue' just says, "skip the rest of 
# the instructions for THIS specific item, and move on to the next one."
#
# 2. $RANDOM: This is a special built-in Bash variable. Every time you call it, 
# it automatically generates a random integer between 0 and 32767.