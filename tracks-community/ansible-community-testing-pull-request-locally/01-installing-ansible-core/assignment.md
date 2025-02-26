---
slug: installing-ansible-core
id: miuuyh7ay9nm
type: challenge
title: Installing Ansible package
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
Ansible Core 2.10 is the first release of Ansible that fully supports Collections and it contains a minimal amount of Core supported modules and plugins.

Install the latest version of `ansible-core` package, which includes `ansible-playbook` and `ansible-galaxy` utilitites.

```
pip3 install ansible-core --user
```

Confirm that the latest ansible-core package is installed successfully by executing the below command:

```
ansible --version
```

~~~
ansible [core 2.11.0rc2]
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /rusr/share/lib64/python3.6/site-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/ansible/developing_colelction/bin/ansible
  python version = 3.6.12 (default, Sep 15 2020, 12:49:50) [GCC 4.8.5 20150623 (Red Hat 4.8.5-37)]
  jinja version = 2.11.3
  libyaml = True
~~~

You can verify ansible-core version from the first line of the above output.