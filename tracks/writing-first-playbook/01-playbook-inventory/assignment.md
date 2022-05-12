---
slug: playbook-inventory
id: wovwghbhairu
type: challenge
title: Create an inventory
teaser: Write your inventory, know whom Ansible talks to!
notes:
- type: text
  contents: Ansible works against multiple managed nodes or “hosts” in your infrastructure
    at the same time, using a list or group of lists known as inventory. For our first
    challenge, we are going to create an inventory to be used in the following challenges.
- type: text
  contents: The inventory tells what nodes are out there to be used by Ansible, what
    credentials need to be used to connect to them, how the nodes are grouped, and
    other necessary variables.
- type: text
  contents: |-
    An example inventory:

    ```
    [all:vars]
    ansible_user=rhel
    ansible_password=SomethingSomething
    ansible_port=22

    [web]
    websrv1
    websrv2

    [db]
    db_1 ansible_host=11.22.33.44
    db_2 ansible_host=44.55.66.77
    ```
tabs:
- title: editor
  type: service
  hostname: control
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel%2Fansible-files
  port: 443
difficulty: basic
timelimit: 300
---
On your control host, we are using a simple directory structure in our home directory for the inventory and future playbooks, the directory `ansible-files`

Open the editor tab, open the directory `ansible-files` and in that directory create the file `hosts` with the content:

```
[web]
node1
node2
```
Click on `Green` check button in bottom right to continue.