#!/bin/bash

FIRST_NAME="${1}"
LAST_NAME="${2}"
touch output.txt
date "+%d-%m-%Y" > output.txt
echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt
cp output.txt backup.txt
cat output.txt 