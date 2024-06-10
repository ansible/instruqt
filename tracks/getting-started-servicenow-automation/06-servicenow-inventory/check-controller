#!/bin/bash

# Define variables
inventory_update_name="ServiceNow inventory - inventory-source"
inventory_name="ServiceNow inventory"
inventory_source="inventory-source"
organization_name="Default"
playbook_path="/tmp/check-inventory-sync.yml"

# Export environment variables
export ADMIN_CONTROLLER_USERNAME=$(agent variable get ADMIN_CONTROLLER_USERNAME)
export ADMIN_CONTROLLER_PASSWORD=$(agent variable get ADMIN_CONTROLLER_PASSWORD)

# Function to run the ansible-playbook command and handle output
run_playbook() {
  local job_template_name="$1"
  local playbook_path="$2"
  
  # Run ansible-playbook and capture output and status
  local output
  output=$(ansible-playbook \
    -e "inventory_update_name='${inventory_update_name}'" \
    -e "inventory_name='${inventory_name}'" \
    -e "inventory_source='${inventory_source}'" \
    -e "organization_name='${organization_name}'" \
    "${playbook_path}" \
    --tags check 2>&1)
  local status=$?
  
  # Print the output for debugging
  echo "$output"
  
  # Handle playbook failure and success messages
  if [ $status -ne 0 ]; then
    if echo "$output" | grep -q "No successful runs found for job template"; then
      echo "FAIL: No successful runs found for job template '${job_template_name}'."
    else
      echo "FAIL: The check playbook failed for an unspecified reason."
    fi
    exit 1
  else
    echo "SUCCESS: The playbook ran successfully."
  fi
}

# Run playbook
run_playbook "$job_template_name" "$playbook_path"
