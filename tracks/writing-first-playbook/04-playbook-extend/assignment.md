---
slug: playbook-extend
id: d34l9wcm20pp
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
In this challenge, you will extend the `apache.yml` Ansible Playbook to include an additional task to complete.

☑️ Task 1 - Adding an additional task to the apache.yml playbook
===

Within the *editor* tab, open the file `apache.yml`. Add the following task at the end of the file.

>### **❗️ WARNING ❗️**
>Make sure that the task is indented the same way as the previous task!


```
  - name: Apache enabled and running
    ansible.builtin.service:
      name: httpd
      enabled: true
      state: started
```

☑️ Task 2 - Running the apache.yml playbook
===

Switch to the *control* tab, and launch the playbook within the corresponding directory `ansible-files`.

```
cd ansible-files
```

```
ansible-navigator run apache.yml
```

Did you notice anything in the output?

The first task just reports OK, while the second reports the status changed.

Why?

It goes back to idempotency. The first task had already been completed but the newly added task had not been done.


☑️ Task 3 - Verify the status of Apache
===

Once the Ansible Playbook completes successfully, run the following ad-hoc command to ensure the service is indeed running

```
ansible node1 -m ansible.builtin.service_facts | grep httpd.service -A 4
```
✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-extend&assignees=rlopez133)

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
