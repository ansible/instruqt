---
slug: publishing-collections-with-ansible-galaxy
id: evr2at4neqer
type: challenge
title: Publishing Ansible Content Collections to private automation hub instance.
teaser: In this challenge you will publish collection tarballs to private automation
  hub instance.
notes:
- type: text
  contents: '#### **Publishing** Ansible Content Collections to private automation
    hub instance.'
tabs:
- title: automationhub-terminal
  type: terminal
  hostname: privatehub-01
difficulty: basic
timelimit: 300
---
In this challenge, we will publish the two collections, `ansible.test_collection` and `community.lab_collection` to private automation hub instance.

## 1. Publish the `ansible.test_collection`. Run the following command from the terminal window.
```
ansible-galaxy collection publish ansible-test_collection-1.0.0.tar.gz -c
```
***

## 2. Publish the `community.lab_collection` to private automation hub instance. Run the following command from the terminal window.

```
ansible-galaxy collection publish community-lab_collection-1.0.0.tar.gz -c
```
***

   *Note*: `-c` option is used to ignore SSL certificate errors

## Click on **Check** for the next challenge