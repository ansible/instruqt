---
slug: playbook-multi-node
id: gvta1aqjyxww
type: challenge
title: From 1 to many
teaser: Real automation speaks to multiple hosts.
notes:
- type: text
  contents: |-
    The real power of Ansible is to apply the same set of tasks reliably to many hosts.

    So what about changing the apache.yml Playbook to run on node2 and node3?
- type: text
  contents: To do that, the playbook will not target an individual  node in the future,
    but instead a group of nodes. Ansible automatically identifies all hosts in the
    group via the inventory.
- type: text
  contents: As a best practice Ansible in real life applications playbooks are usually
    written adressing the group `all` - the limitation to certain nodes or groups
    is enforced at execution time via command line flags or via tools like Ansible
    controller.
tabs:
- title: control
  type: terminal
  hostname: control
- title: editor
  type: service
  hostname: control
  path: /editor/
  port: 443
difficulty: basic
timelimit: 300
---
In the editor, open the `apache.yml` file and Change the `hosts` line value from `node1` to `web`. That way during the next run of the playbook, instead of one host, Ansible targets an entire group.

Run the playbook afterwards on the control host with:

```
cd ansible-files
ansible-navigator run apache.yml -i hosts
```

Once the execution was successful, ssh to `node2` and verify that the service is indeed running:

```
systemctl status httpd
```
