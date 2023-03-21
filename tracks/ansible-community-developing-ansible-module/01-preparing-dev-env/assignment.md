---
slug: preparing-dev-env
id: 6awqlwsxro2r
type: challenge
title: Preparing the developer environment
teaser: '#'
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
timelimit: 400
---
To develop an Ansible module you first need a development environment that has all the required packages installed in it.

Clone the source of Ansible Repository from GitHub:

```
git clone https://github.com/ansible/ansible.git
```

Change directory to the locally cloned Ansible repo:

```
cd ansible
```

Create python virtual environment:

```
python3.9 -m venv ansible-venv
```

Activate the virtual environment and then install required packages that are listed in the requirements.txt file:

```
. ./ansible-venv/bin/activate
```

```
pip3 install --upgrade pip
```

```
pip3 install -r requirements.txt
```

Ansible developers has created an environment script which is bash script that allows you to quickly checkout ansible source and switch to that environment.

Now, run the environment setup script:

```
. ./hacking/env-setup
```

`Note:` Whenever you’re ready to develop Ansible content you need to activate the virtual environment and then execute the environment setup script from the root of the Ansible repo.
`. ./ansible-venv/bin/activate && . ./hacking/env-setup`

Run the` ansible --version` command to verify the developer environment is created successfully.

The output will look similar to the following:

~~~
ansible [core 2.12.0.dev0]  (devel 148d4f6248) last updated 2021/05/27 23:01:53 (GMT +550)
  config file = None
  configured module search path = ['/Users/ompragash/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /Users/ompragash/Git/ansible/lib/ansible
  ansible collection location = /Users/ompragash/.ansible/collections:/usr/share/ansible/collections
  executable location = /Users/ompragash/Git/ansible/bin/ansible
  python version = 3.9.5 (v3.9.5:0a7dcbdb13, May  3 2021, 13:17:02) [Clang 6.0 (clang-600.0.57)]
  jinja version = 3.0.1
  libyaml = True
~~~

From the first line, we can confirm that we are on the latest `devel` branch of the Ansible source.
