---
slug: create--clone-module-locally
id: ae3boemvt28x
type: challenge
title: Create new or Clone a module locally
teaser: '#'
tabs:
- title: shell
  type: terminal
  hostname: shell
difficulty: basic
timelimit: 600
---
For this course, an example collection `example_ns.example_collection` is already created under path `~/ansible_collections/example_ns/example_collections/`.

Now, let's add Ansible `timezone` module to the above collection locally.

Note: Currently `timezone` module is part of the `community.general` collection but for simplicity purposes, we’ll be using it here.

```
cd ~/ansible_collections/example_ns/example_collection/plugins
```

You can refer the `README.md` file to know the list of the directories that can be created under plugins directory.

As we will be adding a module file, we first need to create a directory with name `modules` under `plugins` directory:

```
mkdir modules && cd modules
```

Download Ansible `timezone` module python file:

```
curl -O https://raw.githubusercontent.com/ansible/ansible/stable-2.9/lib/ansible/modules/system/timezone.py
```

~~~
ls -l

-rw-rw-r--. 1 devops devops 14096 Apr 12 15:47 timezone.py
~~~

After you save your module file in the above location, Ansible loads it and you can use it in any local task, playbook, or role.

Likewise you can place your own modules under `plugins/modules` directory from the collection root.

See [Adding a module locally](https://docs.ansible.com/ansible/latest/dev_guide/developing_locally.html#adding-a-module-locally) to add modules locally to Ansible Collections.
