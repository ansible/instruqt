---
slug: playbook-multi-node
id: eq2yygfd7kyl
type: challenge
title: From 1 to many
teaser: Real automation speaks to multiple hosts.
notes:
- type: text
  contents: |-
    The real power of Ansible is to apply the same set of tasks reliably to many hosts.

    So what about changing the apache.yml Playbook to run on node1 and node2?
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
- title: editor
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
👋 Introduction
===
#### Estimated time to complete: *3 minutes*<p>
In this challenge, you will modify your Ansible Playbook to target not just one host (`node1`) but to modify a group of hosts (`web`) and run the playbook on all hosts within the `web` group.

☑️ Task 1 - Modify hosts
===
* The *editor* tab is open by default.

In the editor, open the `apache.yml` file and modify the `hosts` line value from `node1` to `web`.

☑️ Task 2 - Run the apache.yml Ansible Playbook
===

Within the *control* tab, run the Ansible playbook `apache.yml`

```
cd ansible-files
```
```
ansible-navigator run apache.yml
```

>### **❗️ WARNING**
>The playbook task may take a minute or two to complete as it is populating the repository metadata for the first time on `node2`.

☑️ Task 3 - Verify Apache is running on web hosts
===
Once the Ansible Playbook successfully completes, run the following Ansible ad-hoc command to verify the Apache (`httpd`) service is running on all hosts within the `web` group.

```
ansible web -m ansible.builtin.service_facts | grep httpd.service -A4
```

```
            "httpd.service": {
                "name": "httpd.service",
                "source": "systemd",
                "state": "running",
                "status": "enabled"
            },
--
            "httpd.service": {
                "name": "httpd.service",
                "source": "systemd",
                "state": "running",
                "status": "enabled"
            },
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
