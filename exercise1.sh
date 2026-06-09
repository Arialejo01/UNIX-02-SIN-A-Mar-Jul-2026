#!/bin/bash

FIRST_NAME="${1}" # Assigns the first positional argument to a variable
LAST_NAME="${2}" # Assigns the second positional argument to a variable
touch output.txt # Creates a new empty file named output.txt
date "+%d-%m-%Y" > output.txt # Writes the formatted date, overwriting the file's content
echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt # Appends the full name to the end of the file
cp output.txt backup.txt # Copies output.txt to create a backup file
cat output.txt # Reads and prints the file's content to the standard output