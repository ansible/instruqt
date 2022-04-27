#!/bin/bash
USER=rhel


# look for the playbook
if [ ! -f /home/$USER/test.yml ]; then
    fail-message "No playbook named test.yml was found."
    exit
fi

# test the playbook runs successfully
su - $USER -c 'ansible-navigator run /home/$USER/test.yml -m stdout'
retVal=$?
if [ $retVal -ne 0 ]; then
    fail-message "test.yml does not execute successfully"
    exit
fi
