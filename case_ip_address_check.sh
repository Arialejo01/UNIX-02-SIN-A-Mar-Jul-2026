#!/bin/bash
# Assigns the first argument passed to the script (from the command line) to the variable IP_ADDRESS.
IP_ADDRESS="${1}"

# Starts a 'case' statement, which checks the value of IP_ADDRESS against multiple patterns.
# This is much cleaner and easier to read than writing a long chain of 'if-elif-else' statements.
case ${IP_ADDRESS} in

  # Checks if the IP address starts exactly with "192.168." followed by anything else (the '*' is a wildcard).
  192.168.*)
    # If the pattern matches, it prints this message.
    echo "Network is 192.168.x.x"
    
    # The double semicolon ';;' tells Bash that this block is done, 
    # and it should exit the case statement entirely without checking the rest.
    ;;

  # Checks if the IP address starts exactly with "10.0." followed by anything else.
  10.0.*)
    # If the pattern matches, it prints this message.
    echo "Network is 10.0.x.x"
    
    # Ends this match block.
    ;;

  # The asterisk '*' by itself acts as a "catch-all" or default case.
  # If the IP address didn't match ANY of the previous patterns, this block will run.
  *)
    # Prints a default message indicating the network isn't recognized.
    echo "Could not identify the network"
    
    # Ends the default block.
    ;;

# 'esac' is literally the word 'case' spelled backwards. 
# It is the syntax Bash uses to close the entire case statement block.
esac

# ==========================================
# KEY CONCEPTS EXPLANATION:
# ==========================================
# 1. 'case / esac': This is Bash's version of a "switch" statement. It allows you
# to easily check a single variable against multiple different possibilities.
# 
# 2. Wildcards ('*'): In the pattern "192.168.*", the asterisk means "zero or more 
# of any character". So it will match "192.168.1.5", "192.168.100.250", or even "192.168.hello".
#
# 3. Double Semicolons (';;'): These are absolutely mandatory at the end of every option.
# If you forget them, Bash will throw a syntax error.

#192.168.1.1 
#192.168.hola
#10.0.hola
#8.8.8.8