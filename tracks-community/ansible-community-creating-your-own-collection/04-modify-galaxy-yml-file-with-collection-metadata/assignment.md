---
slug: modify-galaxy-yml-file-with-collection-metadata
id: kkknxsugvmi5
type: challenge
title: Modify galaxy.yml With Collection Metadata
teaser: Edit galaxy.yml file with Collection metadata
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
A collection must have a galaxy.yml file that contains the necessary information to build a collection artifact. 

The required keys in the galaxy.yml file are namespace, name, version, readme and authors. On initializing a collection using `ansible-galaxy` command it automatically populates namespace and collection name and you can modify the values accordingly as per your need.

Now, modify `authors` and `description` keys in galaxy.yml file as part of this challenge.

```
cd ~/collections/ansible_collections/community/clock/
```

```
vim galaxy.yml
```

Modify the values with the below information:

```
…
authors:
- Your Name <yourname@domain.com>

…
…
description: This collection is used to configure timezone setting.
```

See Collection [Galaxy metadata structure](https://docs.ansible.com/ansible/latest/dev_guide/collections_galaxy_meta.html#collections-galaxy-meta) for details.