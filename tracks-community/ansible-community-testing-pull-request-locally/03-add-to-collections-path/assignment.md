---
slug: add-to-collections-path
id: nquudxmxgt0q
type: challenge
title: Include ~/ansible-collections to collections path
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
timelimit: 600
---
Include newly created `~/ansible-collections` path to `COLLECTIONS_PATH` in `ansible.cfg` file or environment variable.

For this course, we'll include `~/ansible-collections` to `ANSIBLE_COLLECTIONS_PATH` environment variable.

```
export ANSIBLE_COLLECTIONS_PATH=~/ansible_collections/
```

Now, create a playbook that uses `acl` ansible module to grant user `devops` write access to a file:

```
vim grant-access.yml
```

Copy paste the below content:

Note: Turn on `paste` mode in vim by typing `:set paste`, press `i` and then paste the below text to avoid indendation errors.

```yml
- name: Grant user Devops write access to a file
  hosts: localhost
  become: true
  tasks:
  - ansible.drill.acl:
      path: /etc/foo.conf
      entity: devops
      etype: user
      permissions: w
      state: present
```

Save and exit Vim editor `:wq`.

Execute the playbook with the following command:

```
ansible-playbook grant-access.yml
```

From the output, see there is a setfacl command error for the acl module (plugins/modules/acl.py) like below:

~~~
fatal: [localhost]: FAILED! => {"changed": false, "cmd": "/bin/setfacl --test /etc/foo.conf", "msg": "Usage: setfacl [-bkndRLP] { -m|-M|-x|-X ... } file ...\nTry `setfacl --help' for more information.", "rc": 2, "stderr": "Usage: setfacl [-bkndRLP] { -m|-M|-x|-X ... } file ...\nTry `setfacl --help' for more information.\n", "stderr_lines": ["Usage: setfacl [-bkndRLP] { -m|-M|-x|-X ... } file ...", "Try `setfacl --help' for more information."], "stdout": "", "stdout_lines": []}
~~~

In the next challenge, we'll find and checkout the pull request that fixes the above issue in `acl` module.