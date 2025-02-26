---
slug: create-directory-structure
id: txgmygmsfrzv
type: challenge
title: Create the needed directory structure
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
timelimit: 500
---
When working on Ansible, collections are expected to be under a directory `ansible_collections`.

~~~
ansible_collections/
├── namespace_1
│   ├── collection_1
│   └── collection_2
├── namespace_2
│   ├── collection_1
│   └── collection_2
├── namespace_3
...
~~~

For example:
~~~
ansible_collections/
├── community
│   ├── general
│   ├── mysql
│   └── zabbix
├── ansible
│   └── netcommon
├── vmware
│   └── vmware_rest
├── ...
...
~~~

## Your assignment

Setup the directory structure

Create the directory structure so `ansible` and `ansible-test` knows which collection we are using.

```
mkdir -p ansible_collections/community
```

Go into the newly created directory:

```
cd ansible_collections/community
```

For this training, we’ll use the existing `community.mysql` collection available on GitHub.

Clone the `community.mysql` repository, notice we are specifying the destination is `mysql` (rather than the default `community.mysql`) to comply with what ansible-test expects:

```
git clone https://github.com/ansible-collections/community.mysql.git mysql
```

```
cd mysql
```

Checkout to `ci_example` branch:

```
git checkout ci_example
```

```
ls
```

