#!/bin/bash

USER=rhel

# Set the target directory and file
target_directory="/home/rhel/ansible-files"
target_file="${target_directory}/inventory"
solve_file="/tmp/first-101/solve_10_inventory"

# Make sure solvers exist
/usr/bin/git clone https://github.com/leogallego/instruqt-wyfp-2024-solve.git /tmp/first-101

# Copy solved playbook
cp $solve_file $target_file
chown -R $USER:$USER $target_directory 