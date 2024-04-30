---
slug: playbook-conditionals
id: jtvnbkgt6ulb
type: challenge
title: '1.5 - Conditionals: Decide what to do'
teaser: How about we take routes in the automation - depending on conditions?
notes:
- type: text
  contents: |-
    ![image.png](../assets/image.png)

    In a playbook, you can use Ansible conditionals to execute tasks or plays when certain conditions are met. To implement a conditional, the `when` statement must be used, followed by the condition to test. The condition is expressed using one of the available operators like. We will see an example in this challenge.
tabs:
- title: VSCode Editor
  type: service
  hostname: control
  path: /editor/
  port: 443
- title: control
  type: terminal
  hostname: control
difficulty: ""
timelimit: 1
---
👋 1.5 - Conditionals
===

In the following challenges we will cover the application of conditionals, handlers, and loops in Ansible playbooks. You'll learn to control task execution with conditionals, manage service responses with handlers, and efficiently tackle repetitive tasks using loops.

Let's start with conditionals. Conditionals in Ansible control whether a task should run based on certain conditions. Let's add to the `system_setup.yml` playbook the ability to install the Apache HTTP Server (httpd) only on hosts that belong to the web group in our inventory.

☑️ Task 1 - Update the inventory file
===

> [!NOTE]
> In the **VSCode Editor** tab.

Within the `ansible-files` directory open the `inventory` file and check the inventory has the following groups and hosts. If it doesn't correct it!

```
[web]
node1
node2

[database]
node3
```

☑️ Task 2 - Update our system_setup.yml playbook
===

We will modify our previous playbook to limit tasks to specific hosts within the `[web]` group.
For this, we will use the `hosts: all` setting in our playbook to the target all nodes, but we will be adding a condition with `when:` to some tasks.

Update your `system_setup.yml` playbook with the changes below, pay atention to the `hosts:` and `when:` lines.

```
---
- name: Basic System Setup
  hosts: all
  become: true
  vars:
    user_name: 'padawan'
    package_name: httpd
  tasks:
    - name: Install security updates for the kernel
      ansible.builtin.dnf:
        name: 'kernel'
        state: latest
        security: true
        update_only: true
      when: inventory_hostname in groups['web']

    - name: Create a new user
      ansible.builtin.user:
        name: "{{ user_name }}"
        state: present
        create_home: true

    - name: Install Apache on web servers
      ansible.builtin.dnf:
        name: "{{ package_name }}"
        state: present
      when: inventory_hostname in groups['web']
```

> [!NOTE]
> Notice an Ansible fact variable labeled `inventory_hostname` that is used within the `when` conditional to specify the specific groups that the task should run on. Users are being created in **all** hosts, while the update and apache install is only done in the **[web]** group.

☑️ Task 3 - Run the playbook
===

> [!NOTE]
> In the the *Control* tab

Run the playbook with `ansible-navigator` again:

```
cd ansible-files
```
```
ansible-navigator run system_setup.yml
```

> [!IMPORTANT]
> Did you notice the `skipping` as you ran the playbook?
> This is due to the conditional `when` statement targeting the specific hosts for the tasks even though the `hosts:` label within the `inventory` inventory file is set to `all`.

☑️ Task 4 - Verify
===

Once the Ansible Playbook successfully completes, run the following steps to check manually:

For `node1` (which belongs to the `[web]` group), verify both the user `padawan` and the package `httpd` exist:
```
ssh node1 id padawan
```
```
ssh node1 rpm -q httpd
```

For `node3` (which belongs to the `[database]` group, verify that the user `padawan` exists, but the `httpd` package is missing:
```
ssh node3 id padawan
```
```
ssh node3 rpm -q httpd
```


✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-conditionals&assignees=rlopez133).

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
