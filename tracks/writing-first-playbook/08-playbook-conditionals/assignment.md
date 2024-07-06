---
slug: playbook-conditionals
id: lbxtieceuryh
type: challenge
title: Decide what to do - using conditionals
teaser: How about we take routes in the automation - depending on conditions?
notes:
- type: text
  contents: |-
    In a playbook, you can use Ansible conditionals to execute tasks or plays when certain conditions are met. To implement a conditional, the `when` statement must be used, followed by the condition to test. The condition is expressed using one of the available operators like


    |      |                                                                        |
    | ---- | ---------------------------------------------------------------------- |
    | \==  | Compares two objects for equality.                                     |
    | \!=  | Compares two objects for inequality.                                   |
    | \>   | true if the left hand side is greater than the right hand side.        |
    | \>=  | true if the left hand side is greater or equal to the right hand side. |
    | \<   | true if the left hand side is lower than the right hand side.          |
    | \<= | true if the left hand side is lower or equal to the right hand side.   |
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
timelimit: 1
---
👋 Introduction
===
#### Estimated time to complete: *10 minutes*<p>
In this challenge, you will create a playbook that adds a mail transfer agent (MTA) Postfix with a backend database to send status emails.

☑️ Task 1 - Update the hosts inventory file
===
* The *editor* tab is open by default.

Within the `ansible-files` directory in your *editor* tab, open the `hosts` file and add the following:

```
[web]
node1
node2

[database]
node3
```

☑️ Task 2 - Create a new playbook
===

Create a playbook labeled `extended_services.yml` that installs the `postfix` package on the `web` group hosts (`node1` and `node2`) and install the `postgresql` package on the `database` group of hosts (`node3`).

Within the `ansible-files` directory, right click and select 'New File' to create the `extended_services.yml` file.

>### **❗️ Note**
>Notice an Ansible fact variable labeled `inventory_hostname` that is used within the `when` conditional to specify the specific groups that the task should run on.

Within the `extended_services.yml` file, enter the following content:

```
---
- name: Install extended services
  hosts: all
  become: true
  tasks:
    - name: Install Postfix
      ansible.builtin.package:
        name: postfix
        state: latest
      when: inventory_hostname in groups["web"]
```

Next, add a task installing the database on the node of the group database:

```
    - name: Install database in corresponding group
      ansible.builtin.package:
        name: postgresql
        state: latest
      when: inventory_hostname in groups["database"]
```

☑️ Task 3 - Run the playbook
===

Within the *control* tab, execute the playbook:

```
cd ansible-files
```
```
ansible-navigator run extended_services.yml
```

```
PLAY [Install extended services] ***********************************************

TASK [Gathering Facts] *********************************************************
ok: [node3]
ok: [node1]
ok: [node2]

TASK [Install Postfix] *********************************************************
skipping: [node3]
changed: [node2]
changed: [node1]

TASK [Install database in corresponding group] *********************************
skipping: [node1]
skipping: [node2]
changed: [node3]

PLAY RECAP *********************************************************************
node1                      : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
node2                      : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
node3                      : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
```

Did you notice the `skipping` as you ran the playbook?
This is due to the conditional `when` statement targeting the specific hosts for the tasks even though the `hosts:` label within the `extended_services.yml` playbook file is set to `all`.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-conditionals&assignees=rlopez133).

<style type="text/css" rel="stylesheet">
  .lightbox {
    display: none;
    position: fixed;
    justify-content: center;
    align-items: center;
    z-index: 999;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 1rem;
    background: rgba(0, 0, 0, 0.8);
    margin-left: auto;
    margin-right: auto;
    margin-top: auto;
    margin-bottom: auto;
  }
  .lightbox:target {
    display: flex;
  }
  .lightbox img {
    /* max-height: 100% */
    max-width: 60%;
    max-height: 60%;
  }
  img {
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  h1 {
    font-size: 18px;
  }
    h2 {
    font-size: 16px;
    font-weight: 600
  }
    h3 {
    font-size: 14px;
    font-weight: 600
  }
  p span {
    font-size: 14px;
  }
  ul li span {
    font-size: 14px
  }
</style>
