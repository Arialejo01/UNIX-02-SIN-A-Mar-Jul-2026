#!/bin/bash
USER_INPUT="${1}" #Takes the first argument passed to the script from the command line ($1) and assigns it to a variable named USER_INPUT
 if [[ -z "${USER_INPUT}" ]]; then #Starts an if statement that checks if the USER_INPUT variable is empty (the -z flag checks for a string with zero length)
echo "You must provide an argument!" #If the variable is empty, it prints the message "You must provide an argument!" to the terminal
exit 1 #Exits the script immediately with an error code of 1 (which signals to the system that the script failed or terminated with an error)
fi #Ends the first if block
 if [[ -f "${USER_INPUT}" ]]; then #Starts a new if statement that checks if the path stored in USER_INPUT exists and is a regular file (using the -f flag)
echo "${USER_INPUT} is a file." #If it is a file, it prints that the input is a file
 elif [[ -d "${USER_INPUT}" ]]; then #"Else if" the previous check was false, it checks if the path stored in USER_INPUT exists and is a directory/folder (using the -d flag)
echo "${USER_INPUT} is a directory." #If it is a directory, it prints that the input is a directory
else #If the input is neither a file nor a directory (e.g., it doesn't exist, or it's a special device), this block is triggered
 echo "${USER_INPUT} is not a file or a directory." #Prints that the input is neither a file nor a directory
fi #Ends the second if-elif-else block