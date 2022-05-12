---
slug: playbook-extend
id: epzomafli12x
type: challenge
title: Extend the playbook
teaser: Automation is more than just one task - let's add more!
notes:
- type: text
  contents: By default, Ansible executes each task in order, one at a time, against
    all machines matched by the host pattern. Each task executes a module with specific
    arguments. When a task has executed on all target machines, Ansible moves on to
    the next task.
- type: text
  contents: When you run a playbook, Ansible returns information about connections,
    the name lines of all your plays and tasks, whether each task has succeeded or
    failed on each machine, and whether each task has made a change on each machine.
    At the bottom of the playbook execution, Ansible provides a summary of the nodes
    that were targeted and how they performed. General failures and fatal “unreachable”
    communication attempts are kept separate in the counts.
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
To add another task to the playbook, open the editor and open the file `apache.yml` again. Add the following task at the end of the file:

```
  - name: Apache enabled and running
    ansible.builtin.service:
      name: httpd
      enabled: true
      state: started
```

Make sure that the task is indented the same way as the previous task!

Switch to the control tab, and launch the playbook again in the corresponding directory `ansible-files`:

```
ansible-navigator run apache.yml -i hosts
```

Note how the first task just reports OK, while the second reports the status changed.

Once the execution was successful, ssh to `node1` and verify that the service is indeed running:
```
systemctl status httpd
```