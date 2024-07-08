#!/bin/bash

USER=rhel

# Set the target directory and file
target_directory="/home/rhel/ansible-files"
target_file="${target_directory}/inventory"
solve_file="/tmp/first-101/solve_11_system_setup.yml"
solve_inventory="/tmp/first-101/solve_10_inventory"


## OLD CHECK
#cat >/tmp/hosts.solve <<EOL
#[web]
#node1
#node2
#
#EOL

## Define the hosts file content
#expected_content=$(cat /tmp/hosts.solve)
## END OLD CHECK

# Check if the 'inventory' file exists
if [ -f $target_file ]; then
    # Read the content of the 'inventory' file
    file_content=$(cat $target_file)
    inventory_content=$(cat $solve_inventory)
    # Compare the content of the 'inventory' file with the expected content
    if [ "$file_content" != "$inventory_content" ]; then
        fail-message "The 'inventory' file does not have the proper content. Please try again."
    fi
else
    fail-message "The 'inventory' file does not exist."
fi