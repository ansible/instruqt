#!/bin/bash

tower-cli config verify_ssl false
tower-cli login admin --password ansible123!

test1output=$(tower-cli job list -f json -J "Network Automation - Restore" | jq '.count');

if [[ "$test1output" == "0" ]]; then
    fail-message "You have not launched the 'Network Automation - Restore' job template"
    exit 1
fi