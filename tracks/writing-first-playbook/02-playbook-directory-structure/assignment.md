---
slug: playbook-directory-structure
id: rmnmrlxe8yu8
type: challenge
title: Creating a Directory Structure and your Playbook
teaser: Write the first playbook
notes:
- type: text
  contents: |-
    Playbooks are files which describe the desired configurations or steps to implement on managed hosts. Playbooks can change lengthy, complex administrative tasks into easily repeatable routines with predictable and successful outcomes.

    A playbook can have multiple plays and a play can have one or multiple tasks. In a task, a module is called to run an action against. The goal of a play is to map a group of hosts. The goal of a task is to implement modules against those hosts.
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
tabs:
- title: editor
  type: service
  hostname: control
  path: /editor/
  port: 443
difficulty: basic
timelimit: 1
---
👋 Introduction
===
#### Estimated time to complete: *3 minutes*<p>
In this challenge, you will write a playbook that installs Apache to a server.

☑️ Task 1 - Creation of the apache.yml file
===
* The *editor* tab is open by default.

Within the editor tab, open the directory `ansible-files`. In that directory, right click and create the file `apache.yml`.

☑️ Task 2 - Defining the the apache.yml playbook
===
* The *editor* tab is open by default.

Within the file `apache.yml`, supply the following content:

```
---
- name: Apache server installed
  hosts: node1
  become: true
```
One of Ansible's strengths is the ease to read and understand the flow of a playbook. To start:

* A name is given for the play via `name:`.
* The host to run the playbook against is defined via `hosts:`.
* We enable user privilege escalation (sudo) with `become: true`.

☑️ Task 3 - Adding tasks to the apache.yml playbook
===

With the play defined, let's add a task to install a package on our `node1` host. We will take advantage of the `ansible.builtin.package` module to install the Apache package with the latest version. The `apache.yml` file can be modified as shown below to incorporate the installation of Apache:

```
---
- name: Apache server installed
  hosts: node1
  become: true
  tasks:
  - name: latest Apache version installed
    ansible.builtin.package:
      name: httpd
      state: latest
```

Once we've done our play declarations, we start off with a `tasks` declaration to incorporate what specific tasks we'd like Ansible to automate.

* A task is named and the module (`ansible.builtin.package`) for the task is referenced.
* Parameters for the module are added:
  * `name`: to identify the package name
  * `state`: to define the wanted state (present, absent, latest) of the package

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-directory-structure&assignees=rlopez133).

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
