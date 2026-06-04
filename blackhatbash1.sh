#!/bin/bash
set -x

bash --version
set -x
env
set+x
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}

#man ls
ps -ef
df -h
#bash -r blackhatbash1.sh
#bash -n blackhatbash1.sh
#bash -x blackhatbash1.sh

set +x