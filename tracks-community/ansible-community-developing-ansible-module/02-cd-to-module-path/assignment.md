---
slug: cd-to-module-path
id: 14ya8noij2u9
type: challenge
title: Change directory to the module path
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
To develop a module, navigate to the correct module path `plugins/modules` inside your collection directory.

In this course, we’ll develop a basic `my_test` module that'll be a part of `example_ns.example_collection` collection.

Activate the virtual environment and then execute the environment setup script from the root of the Ansible repo.

```
. ~/ansible/ansible-venv/bin/activate && . ~/ansible/hacking/env-setup
```

Create a collection using `ansible-galaxy` command:

```
mkdir ~/ansible_collections/ && cd ~/ansible_collections/
```

```
ansible-galaxy collection init example_ns.example_collection
```

Create module path for example_ns.example_collection collection:

```
mkdir -p example_ns/example_collection/plugins/modules
```

Change directory to example_ns.example_collection collection module path:

```
cd example_ns/example_collection/plugins/modules
```

Create my_test.py module file:
```
touch my_test.py
```
