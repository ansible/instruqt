#!/bin/bash
USER=rhel


WINPING=`grep -c "doc setup" /home/$USER/ansible-navigator.log`

if [[ $WINPING -lt 1 ]]; 
then
    fail-message "Oh no, you skipped step 6!"
fi
