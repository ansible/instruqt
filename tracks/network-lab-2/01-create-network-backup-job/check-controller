#!/bin/bash

tower-cli config verify_ssl false
tower-cli login admin --password ansible123!


if ! tower-cli job_template list -f json | jq -e '.results[] | select(.name | match("Network Automation - Report";"i"))'; then
    fail-message "You have not created the 'Network Automation - Report' job template"
    exit 1
fi