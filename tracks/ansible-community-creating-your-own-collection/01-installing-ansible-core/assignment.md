---
slug: installing-ansible-core
id: ypdexj7rmig0
type: challenge
title: Installing ansible-core
teaser: How to install ansible-core
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
timelimit: 300
---
Ansible Core 2.10 is the first release of Ansible that fully supports Collections and it contains a minimal amount of Core supported modules and plugins.

To start with, install `ansible-core` package, which includes `ansible-playbook` and `ansible-galaxy` binaries.

```
pip3 install ansible-core --user
```

Confirm that the ansible-core package is installed successfully.

```
ansible --version
```

~~~
ansible [core 2.11.4]
  config file = None
  configured module search path = ['/home/devops/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/share/lib64/python3.6/site-packages/ansible
  ansible collection location = /home/devops/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/devops/.local/bin/ansible
  python version = 3.6.12 (default, Sep 15 2020, 12:49:50) [GCC 4.8.5 20150623 (Red Hat 4.8.5-37)]
  jinja version = 2.11.3
  libyaml = True
~~~

You can verify `ansible-core` version from the first line of the above output.

Additionally you can run `ansible-doc -l` to see the list of all built-in modules that are part of the core package.


