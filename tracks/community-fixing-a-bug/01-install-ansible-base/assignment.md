---
slug: install-ansible-base
id: lgw4oyc9pryh
type: challenge
title: Install Ansible Package
teaser: How to install ansible-base
tabs:
- title: Terminal
  type: terminal
  hostname: shell
- title: VS Code
  type: service
  hostname: shell
  path: /editor/
  port: 80
difficulty: basic
timelimit: 500
---
## Your assignment

* Install ansible-core

To use Ansible we need to have it installed. This will also install any required dependencies.

Install the `ansible-base` package (which includes `ansible-playbook` and `ansible-test`)

```
pip3 install ansible-core --user
```

Ansible Core 2.10 is the first that properly supports Collections:

```
ansible --version
```

The output will look similar to the following:

~~~
ansible 2.11.5
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.8/dist-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 3.6 (default, Jul 13 2020, 23:52:41) [GCC 7.5.0]
~~~

Take note of the first line which confirms we are using at least version 2.10.
