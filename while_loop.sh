#!/bin/bash
#!/bin/bash

# Assigns the string "stoploop" to the variable SIGNAL_TO_STOP_FILE.
SIGNAL_TO_STOP_FILE="stoploop"

# Starts a while loop. It checks if the file named "stoploop" DOES NOT exist.
# The '!' means "NOT", and '-f' checks if it is a regular file.
# NOTE: Spaces are critical here! There must be a space after [[ and before !
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do
  
  # This block runs over and over as long as the file does NOT exist.
  echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
  
  # Pauses the script for 2 seconds before looping back to check the condition again.
  sleep 2

# Closes the while loop.
done

# These lines run only AFTER the loop finishes (which happens the moment you create the "stoploop" file).
echo "Checking again in 2 seconds..."
echo "File was found! Exiting..."