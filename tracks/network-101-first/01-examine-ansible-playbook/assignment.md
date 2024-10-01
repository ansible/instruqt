---
slug: examine-ansible-playbook
id: rysbxmlxol8n
type: challenge
title: Your first Network Ansible Playbook
teaser: For this challenge we will examine an already created Ansible Playbook
notes:
- type: text
  contents: |-
    # Ansible Network Automation Basics

    The lab objective is to use Ansible Automation to update the configuration of a Cisco CSR router. This exercise will not create an Ansible Playbook, but use an existing one that has been provided.

    This exercise will cover:

    - examining an existing Ansible Playbook
    - executing an Ansible Playbook on the command line using the ansible-navigator command
    - check mode (the `--check` parameter)
    - verbose mode (the `--verbose` or -v parameter)
- type: text
  contents: |-
    # What makes up an Ansible Playbook?

    <img src="https://github.com/IPvSean/pictures_for_github/blob/master/what_makes_up_playbook.png?raw=true">
- type: text
  contents: |
    # Ansible Plays

    What am I automating?

    ```yaml
    ---
    - name: configure network devices
      hosts: network
      become: yes
    ```

    **What are they?**

    - *Top level specification for a group of tasks.*

      Will tell that play which hosts it will execute on and control behavior such as fact gathering or privilege level.

    - *Building blocks for playbooks*

      Multiple plays can exist within an Ansible playbook
- type: text
  contents: |
    # Ansible Modules

    *The “tools in the toolkit”*

    ```
        - name: ensure that the desired snmp strings are present
          cisco.ios.config:
            commands:
              - snmp-server community ansible-public RO
              - snmp-server community ansible-private RW
    ```

    **What are they?**

    Parametrized components with internal logic, representing a single step to be done.
    The modules “do” things in Ansible.

    **Language**

    Usually Python, or Powershell for Windows setups. But can be of any language.
- type: text
  contents: |
    # Ansible Plugins

    **What are they?**
    Plugins are pieces of code that augment
    Ansible’s core functionality. Ansible uses a plugin architecture to enable a rich, flexible, and expandable feature set.

    {{ some_variable | `to_nice_json` }}<br>
    {{ some_variable | `to_nice_yaml` }}
- type: text
  contents: |
    # Ansible Inventory

    **What are they?**

    List of systems in your infrastructure that automation is executed against

    ```
    [web]
    webserver1.example.com
    webserver2.example.com

    [db]
    dbserver1.example.com

    [switches]
    leaf01.internal.com
    leaf02.internal.com
    ```
- type: text
  contents: |
    # Ansible Roles

    ```
    ---
    - name: install and start apache
      hosts: network
      roles:
        - network.toolkit.backup
    ```

    **What are they?**

    Group your tasks and variables of your automation in a reusable structure. Write roles once, and share them with others who have similar challenges in front of them.
- type: text
  contents: |
    # Ansible Content Collections

    *Simplified and consistent content delivery*

    **What are they?**

    Collections are a directory structure containing automation content such as:
    - Modules
    - Playbooks
    - Roles
    - Plugins
    - Docs
    - Tests
- type: text
  contents: |-
    # Lets get started

    That is the end of of your lab briefing!

    Once the lab is setup you can click the Green start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="left"> in the bottom right corner of this window.
tabs:
- id: lwysp4xzhegg
  title: code-server
  type: service
  hostname: code-server
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel
  port: 80
- id: 4y0mhv8dnfgs
  title: terminal
  type: terminal
  hostname: code-server
difficulty: basic
timelimit: 600
---
Step 1 - Examine Ansible Playbook
===

Open the `playbook.yml` in the code-server tab.

We will explore in detail the components of an Ansible Playbook in the next exercise. It is suffice for now to see that this playbook will run two Cisco IOS-XE commands:

```
snmp-server community ansible-public RO
snmp-server community ansible-private RW
```

Step 2 - Execute Ansible Playbook
===
Open the terminal tab and run the following command:

```
ansible-navigator run playbook.yml --mode stdout
```


- `--mode stdout` - By default ansible-navigator will run in interactive mode. The default behavior can be modified by modifying the ansible-navigator.yml configuration file. As playbooks get longer and involve multiple hosts the interactive mode allows you to “zoom in” on data in real-time, filter it, and navigate between various Ansible components. Since this task only ran one task on one host the stdout is sufficient.

Step 3 - Verify configuration on router
===

Login to the cisco device and run the show run command to check the configuration:
```
ssh cisco
show running | i snmp
```
Output should be similar to the following:
```
snmp-server community ansible-public RO
snmp-server community ansible-private RW
```
