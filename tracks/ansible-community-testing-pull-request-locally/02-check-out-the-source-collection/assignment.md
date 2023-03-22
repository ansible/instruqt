---
slug: check-out-the-source-collection
id: vyw9rpnnfy8v
type: challenge
title: Check out the source collection
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
To start with, create a directory with the below structure under user's home location to install the collection source.

`mkdir -p ~/ansible_collections/NAMESPACE/COLLECTION_NAME`

For this course, we'll use a minimal collection `ansible.drill` where `ansible` is the namespace name and `drill` is the collection name and it will be created as follows:

```
mkdir -p ~/ansible_collections/ansible/drill
```

Clone `ansible.drill` collection from Github to the above created path:

```
git clone https://github.com/ansible-collections/ansible.drill.git ~/ansible_collections/ansible/drill
```

Checkout to `pr_example` branch:

```
cd ~/ansible_collections/ansible/drill
```

```
git checkout pr_example
```

Run `git branch` command to confirm that the current working branch is `pr_example`.

List the contents of the directory:

```
ls
```