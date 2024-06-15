---
slug: playbook-loops
id: my4e763qnqsr
type: challenge
title: 1.7 - Loops
teaser: When one step is just not enough
notes:
- type: text
  contents: Loops enable us to repeat the same task over and over again. For example,
    lets say you want to create multiple users. By using an Ansible loop, you can
    do that in a single task.
- type: text
  contents: |-
    Loops can also iterate over more than just basic lists. For example, if you have a list of users with their corresponding group, loop can iterate over them as well.

    Find out more about loops in the [Ansible Loops documentation](https://docs.ansible.com/ansible/latest/user_guide/playbooks_loops.html).
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
👋 1.7 - Loops
===

Loops in Ansible allow you to perform a task multiple times with different values. This feature is particularly useful for tasks like creating multiple user accounts in our given example.

In this challenge, you will create a simple loop that generates three new users on `node1`, instead of a single one.


☑️ Task 1 - Create a new playbook
===

> [!NOTE]
> In the **VSCode Editor** tab

Create the file `loop_users.yml`. This can be done by simply right clicking and selecting 'New File'.

The following playbook takes advantage of the `ansible.builtin.user` module to create users on the `node1` host.

Notice the `name: "{{ item }}"`?
This is a special variable named `{{ item }}`. This variable `item` gets replaced with the values found under the `loop:` statement.

```
---
- name: Create multiple users with a loop
  hosts: node1
  become: true

  tasks:
    - name: Create a new user
      ansible.builtin.user:
        name: "{{ item }}"
        state: present
        create_home: true
      loop:
         - alice
         - bob
         - carol
```

What changed from our original task creating a single user?
* Loop Directive: The `loop` keyword is used to iterate over a list of items. In this case, the list contains the names of users we want to create: alice, bob, and carol.
* User Creation with Loop: Instead of creating a single user, the modified task now iterates over each item in the loop list. The `{{ item }}` placeholder is dynamically replaced with each username in the list on each iteration, so the `ansible.builtin.user` module creates each user in turn.


☑️ Task 2 - Run the loop_users.yml playbook
===

> [!NOTE]
> In the **Control** tab

Change directory to `ansible-files` and run the `loop_users.yml` playbook.

```
cd ansible-files
```

```
ansible-navigator run loop_users.yml
```

Understand the playbook and the output:

* The names are not provided to the `ansible.builtin.user` module directly. Instead, there is only a variable called `{{ item }}` for the parameter name.
* The `loop` keyword lists the actual user names. Those replace the `{{ item }}` during the actual execution of the playbook.
* During execution the task is only listed once, but there are three changes listed underneath it.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-loops&assignees=rlopez133).

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
