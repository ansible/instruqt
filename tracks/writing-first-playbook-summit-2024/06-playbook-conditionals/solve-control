#!/bin/bash

USER=rhel

# Set the target directory and file
target_directory="/home/rhel/ansible-files"
target_file="${target_directory}/system_setup.yml"
solve_file="/tmp/first-101/solve_15_system_setup_conditionals.yml"

target_inventory="${target_directory}/inventory"
solve_inventory="/tmp/first-101/solve_15_inventory"

# Make sure solvers exist
/usr/bin/git clone https://github.com/leogallego/instruqt-wyfp-2024-solve.git /tmp/first-101


# Copy solved playbook
cp $solve_inventory $target_inventory
cp $solve_file $target_file
chown -R $USER:$USER $target_directory

## run solve playbook as $USER
#su - $USER -c 'cd ansible-files && ansible-navigator run system_setup.yml -m stdout'

## Run solve playbook
cd $target_directory
ansible-navigator run $solve_file -m stdout