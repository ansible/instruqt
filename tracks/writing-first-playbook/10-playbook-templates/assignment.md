---
slug: playbook-templates
id: 3fxeqnlyxq1i
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
- title: control
  type: terminal
  hostname: control
- title: editor
  type: service
  hostname: control
  path: /editor/
  port: 443
difficulty: basic
timelimit: 600
---
First, in the editor, create the directory `templates` to hold template resources underneath `~/ansible-files/`.

In there, create the file `motd-facts.j2`:

```
Welcome to {{ ansible_hostname }}.
{{ ansible_distribution }} {{ ansible_distribution_version}}
deployed on {{ ansible_architecture }} architecture.
```

The template file contains the basic text that will later be copied over. It also contains variables which will be replaced on the target machines individually.

Next we need a playbook to use this template. In the `~/ansible-files/` directory create the Playbook `motd-facts.yml`:

```
---
- name: Fill motd file with host data
  hosts: node2
  become: true
  tasks:
    - ansible.builtin.template:
        src: motd-facts.j2
        dest: /etc/motd
        owner: root
        group: root
        mode: 0644
```

Execute it on the control host:

```
cd ansible-files
ansible-navigator run motd-facts.yml -i hosts
```

Login to node2 via SSH and check the message of the day content.