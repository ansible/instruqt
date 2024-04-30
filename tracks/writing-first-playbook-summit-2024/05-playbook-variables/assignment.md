---
slug: playbook-variables
id: 1uzwh92fwbvn
type: challenge
title: 1.4 - Adding variables to the mix
teaser: Ansible supports variables to store values that can be used in Playbooks.  Let's
  do this.
notes:
- type: text
  contents: |-
    Ansible supports variables to store values that can be used in Playbooks. Variables can be defined in a variety of places and have a clear precedence. Ansible substitutes the variable with its value when a task is executed.

    Variables are referenced in Ansible Playbooks by placing the variable name in double curly braces:

    ```
    Here comes a "{{ variable1 }}"
    ```
- type: text
  contents: |-
    Variables and their values can be defined in various places: the inventory, additional files, on the command line, etc.

    The recommended practice to provide variables in the inventory is to define them in files located in two directories named `host_vars` and `group_vars`:

    * To define variables for a group “servers”, a YAML file named `group_vars/servers.yml` with the variable definitions is created.
    * To define variables specifically for a host node1, the file `host_vars/node1.yml` with the variable definitions is created.

    Host variables take precedence over group variables (more about precedence can be found in the [docs](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable)).
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
👋 1.4 - Variables
===

Variables in Ansible are powerful tools for making your playbooks flexible and reusable. They allow you to store and reuse values, making your playbooks more dynamic and adaptable.

The creation and usage of variables involve a specific syntax:

1.  Defining Variables: Variables are defined in the `vars` section of a playbook or in separate files for larger projects.
2. Variable Naming: Variable names should be descriptive and adhere to rules such as:
    * Starting with a letter or underscore.
    * Containing only letters, numbers, and underscores.
3. Using Variables: Variables are referenced in tasks using the double curly braces in quotes `"{{ variable_name }}"`. This syntax tells Ansible to replace it with the variable's value at runtime.

☑️ Task 1 - Creation of variables
===

Update the `system_setup.yml` playbook to include and use a variable by adding a `vars:` section with a `user_name:` var and a `padawan` key value.
Look for the changes in the playbook below:

```
---
- name: Basic System Setup
  hosts: web
  become: true
  vars:
    user_name: 'padawan'
  tasks:
    - name: Install security updates for the kernel
      ansible.builtin.dnf:
        name: 'kernel'
        state: latest
        security: true

    - name: Create a new user
      ansible.builtin.user:
        name: "{{ user_name }}"
        state: present
        create_home: true
```

In the playbook above you can notice we have defined a variable (`user_name`) and set a new user name (`padawan`). We later refer to this variable during the **Create a new user** task by using `"{{ user_name }}"`.

☑️ Task 2 - Run the  modified playbook
===

> [!NOTE]
> Switch to the **Control** top tab.

```
cd ansible-files
```
```
ansible-navigator run system_setup.yml
```

☑️ Task 3 - Verify the new user exists in both nodes
===

Once the Ansible Playbook successfully completes, run the following steps to check manually both servers.

For node1:
```
ssh node1  id padawan
```

For node2:
```
ssh node2  id padawan
```


✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-variables&assignees=rlopez133).

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
