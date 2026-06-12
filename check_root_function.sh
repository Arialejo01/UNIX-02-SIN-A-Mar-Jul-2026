#!/bin/bash

# This function checks if the current user ID equals zero.
check_if_root(){
  # Checks if the Effective User ID (EUID) is equal to 0 (the root user's ID).
  if [[ "${EUID}" -eq "0" ]]; then
    # If true, it returns 0 (which means success/true in Bash).
    return 0
  else
    # If false, it returns 1 (which means failure/false in Bash).
    return 1
  fi
}

# Calls the function check_if_root and evaluates its return value.
if check_if_root; then
  # If the function returns 0 (success), it prints this message.
  echo "User is root!"
else
  # If the function returns 1 (failure), it prints this message.
  echo "User is not root!"
fi


# ==========================================
# EXPLANATION OF EUID (Effective User ID):
# ==========================================
# EUID stands for "Effective User ID". 
# In Linux/Unix systems, the system uses the EUID to determine what access 
# permissions a process or script has right now. 
# While your normal UID is who you logged in as, your EUID can change 
# (for example, if you use 'sudo', your EUID temporarily becomes 0).
# The root user (the ultimate administrator) ALWAYS has an EUID of 0. 
# Therefore, checking if EUID equals 0 is the standard way to verify 
# if a script is being run with administrator/root privileges.

# Creates a new user account named 'luna' and also creates their home directory (/home/luna) because of the '-m' flag.
useradd -m luna

# Switches the current user session to the newly created user 'luna' ('su' stands for substitute user).
su luna

# Runs the bash script named 'check_root_function.sh' (the script from your previous question) using the bash interpreter.
bash check_root_function.sh
