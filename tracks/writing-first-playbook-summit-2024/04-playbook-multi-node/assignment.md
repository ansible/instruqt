---
slug: playbook-multi-node
id: fbhfx6l8iear
type: challenge
title: 1.3 - From 1 to many
teaser: Real automation speaks to multiple hosts.
notes:
- type: text
  contents: |+
    The real power of Ansible is to apply the same set of tasks reliably to many hosts.

    What about running our Playbook on 2 nodes?

    To do that, the playbook will not target an individual  node in the future, but instead a group of nodes. Ansible automatically identifies all hosts in the group via the inventory.

tabs:
- title: VSCode Editor
  type: service
  hostname: control
  path: /editor/
  port: 443
- title: control
  type: terminal
  hostname: control
difficulty: basic
timelimit: 1
---
👋 1.3 - From 1 to many
===

The biggest strength of automation lies in its ability to manage multiple systems simultaneously. In this challenge, you will modify your Ansible Playbook to target not just one host (`node1`), but to modify a group of hosts (`web`) and run the playbook on all hosts within that group.

☑️ Task 1 - Modify hosts in the playbook
===

> [!NOTE]
> In the *VSCode Editor* tab

Open your `system_setup.yml` playbook and modify the `hosts:` line value from the individual `node1` to the `web` group. Look at the example below:

```
---
- name: Basic System Setup
  hosts: web
  become: true
```

☑️ Task 2 - Run the system_setup.yml  playbook again
===

> [!NOTE]
> Switch to the *Control* top tab.

Go into the playbook directory:

```
cd ansible-files
```

And run the Ansible playbook again with `ansible-navigator`

```
ansible-navigator run system_setup.yml
```

> [!WARNING]
> The playbook task may take a minute or two to complete as it is populating the repository metadata and updating packages for the `node2`.

☑️ Task 3 - Verify myuser exists in both nodes
===
Once the Ansible Playbook successfully completes, run the following steps to check manually `myuser` exists in both servers.

For node1:
```
ssh node1 id myuser
```

For node2:
```
ssh node2 id myuser
```

Output should look like this:
```
uid=1008(myuser) gid=1009(myuser) groups=1009(myuser)
```

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.


🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-multi-node&assignees=rlopez133)

<style type="text/css" rel="stylesheet">
  .lightbox {
    display: none;
    position: fixed;
    justify-content: center;
    align-items: center;
    z-index: 999;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 1rem;
    background: rgba(0, 0, 0, 0.8);
    margin-left: auto;
    margin-right: auto;
    margin-top: auto;
    margin-bottom: auto;
  }
  .lightbox:target {
    display: flex;
  }
  .lightbox img {
    /* max-height: 100% */
    max-width: 60%;
    max-height: 60%;
  }
  img {
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  h1 {
    font-size: 18px;
  }
    h2 {
    font-size: 16px;
    font-weight: 600
  }
    h3 {
    font-size: 14px;
    font-weight: 600
  }
  p span {
    font-size: 14px;
  }
  ul li span {
    font-size: 14px
  }
</style>
