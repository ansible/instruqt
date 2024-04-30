#!/bin/bash

USER=rhel

# Set the target directory and file
target_directory="/home/rhel/ansible-files"
target_file="${target_directory}/system_setup.yml"
target_inventory="${target_directory}/inventory"
solve_file="/tmp/first-101/solve_15_system_setup_conditionals.yml"
solve_inventory="/tmp/first-101/solve_15_inventory"

# Make sure solvers exist
/usr/bin/git clone https://github.com/leogallego/instruqt-wyfp-2024-solve.git /tmp/first-101

# Copy solved playbook
#cp $solve_file $target_file
#chown $USER:$USER $target_file 

# Check if the target_file file exists
if [ -f "$target_file" ]; then
    # Read the content of the target_file file and solve_file
    file_content=$(cat "$target_file")
    solve_content=$(cat "$solve_file")

    # Compare the content of the target_file file with the expected content
    if [ "$file_content" != "$solve_content" ]; then
        fail-message "Challenge 1.5 - The 'system_setup.yml' file does not have the proper content. Please check the file and try again."
    fi
else
    fail-message "Challenge 1.5 - The 'system_setup.yml' file does not exist in the specified directory."
fi


# Check if the inventory file exists
if [ -f "$target_inventory" ]; then
    # Read the content of the target_file file and solve_file
    inventory_content=$(cat "$target_inventory")
    inventory_solve=$(cat "$solve_inventory")

    # Compare the content of the target_file file with the expected content
    if [ "$inventory_content" != "$inventory_solve" ]; then
        fail-message "Challenge 1.5 - The 'inventory' file does not have the proper content. Please check the file and try again."
    fi
else
    fail-message "Challenge 1.5 - The 'inventory' file does not exist in the specified directory."
fi



## run solve playbook as $USER
#su - $USER -c 'cd ansible-files && ansible-navigator run system_setup.yml -m stdout'

## Run solve playbook
#cd $target_directory
#ansible-navigator run $solve_file -m stdout --check