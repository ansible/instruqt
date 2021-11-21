# `extra_vars.yml` example

## Instructions

1. Copy the below into a new file called `extra_vars.yml`
2. Save `extra_vars.yml` to `images/ansible/extra_vars.yml`

## `extra_vars.yml`
```
---
####
# Extra vars example file for Instruqt automation controller image building
####

##
# Red Hat login details
# Required
##
redhat_username: ''
redhat_password: ''

##
# access.redhat.com offline token
# You can retrieve your token from https://access.redhat.com/management/api
# Required
##
offline_token: ''

##
# AAP setup bundle download path. If left blank, the latest stable release will be used
# e.g. "https://<location_of_download>/ansible-automation-platform-setup-bundle-latest.tar.gz"
# Default: Latest controller bundle installer from access.redhat.com using offline_token
##
#aap_download_url: ''

##
# Automation controller install setup command
# Optional
# Installation command to install controller
# Default: "./setup.sh -e gpgcheck=0" if undefined or empty
#
#controller_install_command: './setup.sh -e gpgcheck=0'

##
# Password for automation controller admin user
# Optional
# Default: "ansible123!" if undefined or empty
##
#admin_password: "ansible123!"

##
# Password for rhel user
# Default: "ansible123!" if undefined or empty
##
#rhel_user_password: "ansible123!"

##
# Code server password
# Default: "ansible123!" if undefined or empty
##
#code_server_password: "ansible123!"

##
# Install controller
# Optional
# Default:
#   controllerinstall: true
# Choose to install controller or tower
#controllerinstall: true

##
# Install automation mesh lab
# Optional
# Default:
#   mesh_lab: false
# If true, mesh inventory used to build image
##
#mesh_lab: true

##
# ee_registry_name
# Optional
# Default:
#   ee_registry_name: registry.redhat.io
# Image repo for EEs and controller registry credentials
##
#ee_registry_name: registry.redhat.io

##
# EE images pull with awx user in controller
# Optional
# Default:
# ee_images:
#  - "registry.redhat.io/ansible-automation-platform-20-early-access/ee-supported-rhel8:2.0.0"
#  - "registry.redhat.io/ansible-automation-platform-20-early-access/ee-29-rhel8:2.0.0"
#  - "registry.redhat.io/ansible-automation-platform-20-early-access/ee-minimal-rhel8:2.0.0"
##
# ee_images:
#  - "registry.redhat.io/ansible-automation-platform-20-early-access/ee-supported-rhel8:2.0.0"
#  - "registry.redhat.io/ansible-automation-platform-20-early-access/ee-29-rhel8:2.0.0"
#  - "registry.redhat.io/ansible-automation-platform-20-early-access/ee-minimal-rhel8:2.0.0"
```