---
slug: creating-example-collection
id: nxbgmaltwzta
type: challenge
title: Creating An Example Collection
teaser: Creating an example collection
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
For example purpose, we’ll create a collection named `clock` that consists of Ansible `timezone` module.

Note: Currently `timezone` module is part of the `community.general` collection but for simplicity purposes, we’ll be using it here.

```
cd ~/collections/ansible_collections/community/clock/plugins
```

You can refer the `README.md` file to know the list of the directories that can be created under plugins directory.

As we will be copying a module file, we first need to create a directory with name `modules` under `plugins` directory:

```
mkdir modules && cd modules
```

Download Ansible `timezone` module python file:

```
curl -O https://raw.githubusercontent.com/ansible/ansible/stable-2.9/lib/ansible/modules/system/timezone.py
```

~~~
ls -l

-rw-rw-r--. 1 root root 14096 Apr 12 15:47 timezone.py
~~~

Likewise you can place your own modules under `plugins/modules` directory and other plugins lookups, filters, and so on in their respecting directory by creating them.

See [Developing collections](https://docs.ansible.com/ansible/latest/dev_guide/developing_collections.html) to develop a collection.
