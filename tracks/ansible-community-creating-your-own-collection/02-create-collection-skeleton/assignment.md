---
slug: create-collection-skeleton
id: dejqxa1ypkty
type: challenge
title: Creating Collection Skeleton Using ansible-galaxy Command
teaser: Creating collection skeleton using ansible-galaxy command
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
The collection is a standardized way to organize and package Ansible content (roles, modules, module utilities, plugins, documentation).

Collection Directory Structure:

```
    collection/
    ├── docs/
    ├── galaxy.yml
    ├── meta/
    │   └── runtime.yml
    ├── plugins/
    │   ├── modules/
    │   ├── inventory/
    │   └── .../
    ├── README.md
    ├── roles/
    │   ├── role1/
    │   └── .../
    ├── playbooks/
    └── tests/
```

A collection must have a galaxy.yml file that contains the necessary information to build a collection artifact. See Collection [Galaxy metadata structure](https://docs.ansible.com/ansible/latest/dev_guide/collections_galaxy_meta.html#collections-galaxy-meta) for details.

Not all the directories are required unless you have specific content that belongs in one of them.

The default collection path is `~/.ansible/collections` followed by `/usr/share/ansible/collections`. 

Now, for this exercise create a directory path for collection use under the user home directory.

```
mkdir -p ~/collections/ansible_collections && cd ~/collections/ansible_collections
```

Let Ansible know the newly created path to search for collections content by exporting it to `ANSIBLE_COLLECTIONS_PATH` environment variable:

```
export ANSIBLE_COLLECTIONS_PATH=~/collections/ansible_collections
```

Use the `ansible-galaxy` command to create a collection skeleton:

```
ansible-galaxy collection init community.clock
```

Here, `community` is the namespace name and `clock` is the collection name.

See [Developing collections](https://docs.ansible.com/ansible/latest/dev_guide/developing_collections.html) to develop a collection and [Galaxy namespaces](https://galaxy.ansible.com/docs/contributing/namespaces.html#galaxy-namespaces) on the Galaxy docsite for namespace requirements.

Run `tree` command to see the directory structure of newly created `community.clock` collection.

```
tree

.
└── community
    └── clock
        ├── docs
        ├── galaxy.yml
        ├── plugins
        │   └── README.md
        ├── README.md
        └── roles
```