---
slug: playbook-directory-structure
id: 9huyibfkpeb3
type: challenge
title: Creating a Directory Structure and your Playbook
teaser: Write the first playbook
notes:
- type: text
  contents: |-
    Playbooks are files which describe the desired configurations or steps to implement on managed hosts. Playbooks can change lengthy, complex administrative tasks into easily repeatable routines with predictable and successful outcomes.

    A playbook can have multiple plays and a play can have one or multiple tasks. In a task a module is called, like the modules in the previous chapter. The goal of a play is to map a group of hosts. The goal of a task is to implement modules against those ho
- type: text
  contents: |-
    Playbooks are text files written in YAML format and therefore need:

    * to start with three dashes (---)
    * proper indentation using spaces and not tabs!

    There are some important concepts:

    * `hosts`: the managed hosts to perform the tasks on
    * `tasks`: the operations to be performed by invoking Ansible modules and passing them the necessary options.
    * `become`: privilege escalation in Playbooks, same as using -b in the ad hoc command.
- type: text
  contents: Good Playbooks are idempotent, so if a Playbook is run once to put the
    hosts in the correct state, it should be safe to run it a second time and it should
    make no further changes to the hosts.
- type: text
  contents: |-
    In this challenge you create a playbook to set up an Apache web server in three steps:

    1. Install httpd package
    1. Enable/start httpd service
    1. Copy over an web.html file to each web host
- type: text
  contents: |-
    The Playbook makes sure the package containing the Apache web server is installed.

    There is a best practice on the preferred directory structures for playbooks. We strongly encourage you to read and understand these practices as you develop your Ansible ninja skills. That said, our playbook today is very basic and creating a complex structure will just confuse things.

    Instead, we are going to use the simple directory structure for our playbook, and add just a couple of files to it.
tabs:
- title: editor
  type: service
  hostname: control
  path: /editor/
  port: 443
difficulty: basic
timelimit: 300
---
Next we will write the playbook. In the editor, create a file called `apache.yml` in the directory `ansible-files` with the following content.

```
---
- name: Apache server installed
  hosts: node1
  become: yes
```

This shows one of Ansible’s strengths: The Playbook syntax is easy to read and understand. In this Playbook:

* A name is given for the play via `name:`.
* The host to run the playbook against is defined via `hosts:`.
* We enable user privilege escalation with `become:`.

Now that we’ve defined the play, let’s add a task to get something done. We will add a task in which yum will ensure that the Apache package is installed in the latest version. Modify the file so that it looks like the following listing:

```
---
- name: Apache server installed
  hosts: node1
  become: yes
  tasks:
  - name: latest Apache version installed
    ansible.builtin.yum:
      name: httpd
      state: latest
```

In the added lines:

* We started the tasks part with the keyword `tasks`:.
* A task is named and the module for the task is referenced. Here it uses the yum module.
* Parameters for the module are added:
  * `name`: to identify the package name
  * `state`: to define the wanted state of the package
