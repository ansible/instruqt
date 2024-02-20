#!/bin/bash

# make challenge dir
su - rhel -c 'mkdir /home/rhel/challenge-6'

# Create a playbook for the user to execute which will create a SN incident
tee /home/rhel/challenge-6/create-inventory-project.yml << EOF
---
- name: Configure SCM project 
  hosts: localhost
  connection: local
  collections:
    - awx.awx

  tasks:

  - name: Add SCM project
    awx.awx.project:
      name: "ServiceNow inventory project"
      description: "Project that contains a now.yml to be sourced by an inventory"
      organization: Default
      state: present
      scm_type: git
      scm_url: https://github.com/cloin/instruqt-snow
      scm_update_on_launch: true
      controller_host: "https://localhost"
      controller_username: admin
      controller_password: ansible123!
      validate_certs: false

EOF

# chown above file
su chown rhel:rhel /home/rhel/challenge-6/create-inventory-project.yml

# execute above playbook
su - rhel -c 'ansible-playbook /home/rhel/challenge-6/create-inventory-project.yml'



# Write a new playbook to create an inventory sourcing project above
tee /home/rhel/challenge-6/create-inventory.yml << EOF
---
- name: Configure servicenow inventory
  hosts: localhost
  connection: local
  gather_facts: false
  collections:
    - awx.awx

  tasks:

  - name: Add servicenow inventory
    awx.awx.inventory:
      name: "ServiceNow inventory"
      description: "Servers added to ServiceNow CMDB"
      organization: "Default"
      state: present
      controller_host: "https://localhost"
      controller_username: admin
      controller_password: ansible123!
      validate_certs: false

  - name: Add an inventory source
    inventory_source:
      name: "inventory-source"
      description: "now.yml from project 'ServiceNow inventory project'"
      inventory: "ServiceNow inventory"
      credential: "servicenow credential"
      source: scm
      source_project: "ServiceNow inventory project"
      source_path: now.yml
      overwrite: true
      update_on_launch: true
      organization: Default
      controller_host: "https://localhost"
      controller_username: admin
      controller_password: ansible123!
      validate_certs: false

  - name: Add created inventory role to student
    role:
      user: student
      role: "{{ item }}"
      inventories:
        - "ServiceNow inventory"
      controller_username: admin
      controller_password: ansible123!
      validate_certs: false
    loop:
      - "read"
      - "use"
      - "update"

EOF

# chown above file
sudo chown rhel:rhel /home/rhel/challenge-6/create-inventory.yml

# Execute above playbook
su - rhel -c 'ansible-playbook /home/rhel/challenge-6/create-inventory.yml'
