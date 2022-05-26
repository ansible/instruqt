---
slug: ansible-navigator-intro
id: rhdswz55nmob
type: challenge
title: Introduce the environment
teaser: In this challenge, we'll explore the navigator and code-editor environment
notes:
- type: text
  contents: |-
    [`ansible-navigator`](https://github.com/ansible/ansible-navigator) is a textual user interface (TUI) available to Ansible Automation Platform subscribers and has been introduced with Ansible Automation Platform 2 as the primary interface for creating and testing ansible automation.
    <br><br><br>
    `ansible-navigator` also functions as a drop-in replacement for `ansible-playbook`, among other `ansible-*` utilities, and is the standard way of executing automation moving into Ansible Automation Platform 2.
tabs:
- title: code-server
  type: service
  hostname: code-server
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel
  port: 80
difficulty: basic
timelimit: 450
---
`ansible-navigator` has been built to fit into common developer workflows and will be used from within the [`code-server`](https://github.com/cdr/code-server) integrated terminal. ***Note that `code-server` is not packaged with Ansible Automation Platform and is not at all affilliated with Red Hat***

Open the integrated terminal `Terminal > New Terminal` and:


**1.** Quickly test that navigator has been installed, run:
```
ansible-navigator --help
```

***

**2.** Now that we know `ansible-navigator` was installed successfully, try writing a quick playbook called `test.yml` to ping localhost. It could look something like this:
```
---
- name: this is just a test
  hosts: localhost
  gather_facts: true
  tasks:

  - name: ping test
    ping:
```

**3.** Now, run it with `ansible-navigator`:
```
ansible-navigator run ./test.yml -m stdout
```
<br>
You should be looking at something like this (and looking very much like `ansible-playbook` output):

```
[rhel@code-server ~]$ ansible-navigator run ./test.yml -m stdout
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [this is just a test] *****************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [ping test] ***************************************************************
ok: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
<br>

***
**Note:** `-m stdout` will run in standard out mode which will display execution results just like `ansible-playbook`
