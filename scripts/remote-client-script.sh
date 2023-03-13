#!/bin/bash

# Redirects display of all users on the machine to text file
# Copied to remote client(s) and executed in playbooks/shell-script.sh

cat /etc/passwd | cut -d: -f1 > all_users.txt
