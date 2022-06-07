---
slug: understanding-lab-environment
id: cvorjn9mga5s
type: challenge
title: Understanding the lab environment
teaser: In this challenge you will understand the lab environment setup for collection
  signing and verification.
notes:
- type: text
  contents: |-
    #### **Content signing** is a new security-focused feature available in **Ansible Automation Platform 2.2** as a **technology preview** supported feature.


    #### It establishes a new framework for a chain of custody for Ansible automation content, with a goal for end-to-end content signing and distribution. Starting first with digitally signing collections, and then execution environments in the future, this feature helps ensure that the automation being executed in your enterprise is certified and compliant.
tabs:
- title: automationhub-terminal
  type: terminal
  hostname: privatehub-01
- title: automationhub-web
  type: service
  hostname: privatehub-01
  path: /
  port: 443
difficulty: basic
timelimit: 300
---
It's important to understand the lab environment first before starting the challenges, in this lab you will see two tabs:

* `automationhub-terminal` - We will use this tab to run commands from the ansible-galaxy cli to interact with the AutomationHub WebUI.
* `automationhub-web` - This is the WebUI for private automation hub and will be used to sign and approve the uploaded collections. You can login to the WebUI using the below username/password combination.
  * Username: `admin`
  * Password: `ansible123!`

This system already has the `ansible-galaxy` CLI tool installed from the Ansible Automation Platform 2.2 installer. If you run the `ls` command on the terminal tab, you wil find a few artifacts which are explained below:

1. `ansible.cfg` - This file contains the galaxy configuration to interact with the installed private automation hub, which also implies that any `ansible-galaxy` command that runs from the present folder (`/home/rhel/`) will interact with the deployed private automation hub with this lab.
2. `ansible-test_collection-1.0.0.tar.gz` - A dummy collection that will be pushed to private automation hub instance, the namespace `ansible` already exists on the private automation hub.
3. `community-lab_collection-1.0.0.tar.gz` - A dummy collection that will be pushed to private automation hub instance, the namespace `community` already exists on the private automation hub.
4. `galaxy_signing_service.asc` - This is the public key from the gpg keypair that is used to configure signing on the private automation hub instance, this key will be used to install and verify collections from private automation hub.

***
Content signing verification capabilities are only available in `ansible-core` version >=2.13, you can check the version of `ansible` using the below command
```
ansible --version
```
***
Please click the **Next** button to continue learning.