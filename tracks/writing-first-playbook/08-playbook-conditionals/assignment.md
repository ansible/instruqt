---
slug: playbook-conditionals
id: 8xfsttuuhyus
type: challenge
title: Decide what to do - using conditionals
teaser: How about we take routes in the automation - depending on conditions?
notes:
- type: text
  contents: In a playbook, you may want to execute different tasks, or have different
    goals, depending on the value of a fact (data about the remote system), a variable,
    or the result of a previous task. You may want the value of some variables to
    depend on the value of other variables. Or you may want to create additional groups
    of hosts based on whether the hosts match other criteria. You can do all of these
    things with conditionals.
- type: text
  contents: 'The simplest conditional statement applies to a single task. Create the
    task, then add a when statement that applies a test: `when: ansible_selinux.status
    == "enabled"`'
tabs:
- title: editor
  type: service
  hostname: control
  path: /editor/
  port: 443
- title: control
  type: terminal
  hostname: control
difficulty: basic
timelimit: 600
---
Imagine we are extending our setup: the web servers will get an MTA to be able to send status mails, and we add a backend database.

To do that, open the `hosts` file in the `ansible-files` directory in your editor. Change the file to add another entry:

```
[web]
node1
node2

[database]
node3
```

Next, we will write a playbook installing the services depending on what group the node is in. In the directory `ansible-files`, create the file `extended_services.yml`. First, we add the task to install the MTA Postfix on all node of the group `web`:

```
---
- name: Install extended services
  hosts: all
  become: true
  tasks:
    - name: Install MTA in web group
      ansible.builtin.yum:
        name: postfix
        state: latest
      when: inventory_hostname in groups["web"]
```

Next, add a task installing the database on the node of the group database:

```
    - name: Install database in corresponding group
      ansible.builtin.yum:
        name: postgresql
        state: latest
      when: inventory_hostname in groups["database"]
```

On the control host, execute the playbook:

```
cd ansible-files
ansible-navigator run extended_services.yml -i hosts
```