---
slug: playbook-templates
id: jr7lijnkrpdy
type: challenge
title: Templates
teaser: Templates give the power to create multiple host specific configuration from
  the same file.
notes:
- type: text
  contents: Ansible uses [Jinja2](http://jinja.pocoo.org/) templating to modify files
    before they are distributed to managed hosts. Jinja2 is one of the most used template
    engines for Python.
- type: text
  contents: When a template for a file has been created, it can be deployed to the
    managed hosts using the template module, which supports the transfer of a local
    file from the control node to the managed hosts.
- type: text
  contents: A typical ending for a file to indicate that it is a template file is
    `.j2`. Though this is strictly speaking not necessary, it is established practice.
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
#### Estimated time to complete: *7 minutes*<p>
In this challenge, you will create a Jinja2 template. Ansible uses Jinja2 templating to modify files before they are distributed to managed hosts. Jinja2 is one of the most used template engines for Python (http://jinja.pocoo.org/).


☑️ Task 1 - Create a templates directory
===
* The *editor* tab is open by default.

In the *editor* tab, create the directory `templates` (right click and select 'New Folder') to hold template resources underneath `~/ansible-files/`.

☑️ Task 2 - Create the motd-facts.j2 jinja file
===

Within `ansible-files/templates` directory, create the file `motd-facts.j2`:

```
Welcome to {{ ansible_hostname }}.
{{ ansible_distribution }} {{ ansible_distribution_version}}
deployed on {{ ansible_architecture }} architecture.
```

The template file contains the basic text that will later be copied over to the hosts. It contains variables that will be replaced on the target machines individually.

☑️ Task 2 - Create the motd-facts.yml playbook
===

Create an Ansible playbook that uses the newly created template file. Within the *editor* tab in the `ansible-files` folder, right click and select 'New File' and create `motd-facts.yml`:

```
---
- name: Fill motd file with host data
  hosts: node1
  become: true
  tasks:
    - ansible.builtin.template:
        src: motd-facts.j2
        dest: /etc/motd
        owner: root
        group: root
        mode: 0644
```

☑️ Task 3 - Run the motd-facts.yml playbook
===

In the *control* tab, run the `motd-facts.yml` playbook.

```
cd ansible-files
```
```
ansible-navigator run motd-facts.yml
```

☑️ Task 4 - Verify message of the day
===

Login to `node1` via SSH and check the message of the day content.

```
ssh node1
```
```
Welcome to node1.
RedHat 8.5
deployed on x86_64 architecture.
```

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-templates&assignees=rlopez133).

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
