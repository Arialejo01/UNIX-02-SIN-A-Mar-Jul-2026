#!/bin/bash
# Assigns the string "output1.txt" to the variable named FILE.
FILE="output1.txt"

# The 'touch' command creates the file "output1.txt" if it doesn't exist, ensuring it starts as an empty file.
touch "${FILE}"

# Starts an 'until' loop. The '-s' flag checks if a file exists AND has a size greater than zero (meaning it is not empty).
# Unlike a 'while' loop that runs AS LONG AS a condition is true, an 'until' loop runs UNTIL the condition becomes true.
# So, this loops as long as the file remains empty.
until [[ -s "${FILE}" ]]; do
  
  # Prints a message to the terminal indicating the file is currently empty.
  echo "${FILE} is empty..."
  
  # Prints a message saying it will check again shortly.
  echo "Checking again in 2 seconds..."
  
  # Pauses the script for 2 seconds before looping back to check the file size again.
  sleep 2

# Closes the loop block.
done

# This line only executes AFTER the loop finishes. 
# The loop will only finish when you open another terminal and add text to "output1.txt" (e.g., echo "hello" > output1.txt).
echo "${FILE} appears to have some content in it!"