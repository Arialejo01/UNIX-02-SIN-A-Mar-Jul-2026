#!/bin/bash

NAME="${1}"                                                  # store the first argument (the friendly name)
DOMAIN="${2}"                                                # store the second argument (the target domain)
OUTPUT_FILE="results.csv"                                    # set the CSV file path where results are saved

# Check if the two expected arguments are set
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then          # -z is true when a string is empty, so this catches missing args
  echo "You must provide two arguments to this script."      # tell the user what went wrong
  echo "Example: ${0} mysite nostarch.com"                   # ${0} is the script name, shown as a usage hint
  exit 1                                                      # exit with code 1 to flag the missing-argument error
fi

# Write CSV header to the file
echo "status,name,domain,timestamp" > "${OUTPUT_FILE}"       # > creates/overwrites the file with the column header

if ping -c 1 "${DOMAIN}" &> /dev/null; then                  # -c 1 sends one packet; &> /dev/null hides stdout+stderr, the if reads the exit status
  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"  # ping returned 0, so append a success row ($(date) inserts current date/time)
else
  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"  # ping returned non-zero, so append a failure row instead
fi
