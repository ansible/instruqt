---
slug: clone-collection-that-requires-integration-tests
id: d3cye2zxcpyr
type: challenge
title: Choose a Collection that needs integration tests
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
timelimit: 600
---
For this course, we'll use `community.postgresql` collection and write a basic integration test for the postgresql_info module.

Create the following directory for use of `community.postgresql` collection:

```
mkdir -p ~/ansible_collections/community/postgresql
```

Clone `community.postgresql` into the newly created directory:

```
git clone https://github.com/ansible-collections/community.postgresql ~/ansible_collections/community/postgresql
```

```
cd ~/ansible_collections/community/postgresql
```

Switch to `integration_example` branch:

```
git checkout integration_example
```

Verify that you're on `integration_example` branch by running the below command:

```
git branch
```