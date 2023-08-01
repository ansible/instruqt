#!/bin/bash

#Verify httpd is installed
ansible node1 /home/rhel/ansible-files/hosts -m ansible.builtin.shell -a "rpm -q httpd"

