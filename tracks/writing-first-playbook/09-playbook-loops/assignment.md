---
slug: playbook-loops
id: lgfl9gszfqbb
type: challenge
title: Using Loops
teaser: When one step is just not enough
notes:
- type: text
  contents: Loops enable us to repeat the same task over and over again. For example,
    lets say you want to create multiple users. By using an Ansible loop, you can
    do that in a single task.
- type: text
  contents: |-
    Loops can also iterate over more than just basic lists. For example, if you have a list of users with their coresponding group, loop can iterate over them as well.

    Find out more about loops in the [Ansible Loops documentation](https://docs.ansible.com/ansible/latest/user_guide/playbooks_loops.html).
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
timelimit: 600
---
To show the loops feature we will generate three new users on `node2`. For that, open the editor and create the file `loop_users.yml`. We will use the user module to generate the user accounts.

```
---
- name: Ensure users
  hosts: node2
  become: true

  tasks:
    - name: Ensure three users are present
      ansible.builtin.user:
        name: "{{ item }}"
        state: present
      loop:
         - dev_user
         - qa_user
         - prod_user
```

On the control host, run the playbook:

```
cd ansible-files
ansible-navigator run loop_users.yml -i hosts
```

Understand the playbook and the output:

* The names are not provided to the user module directly. Instead, there is only a variable called `{{ item }}` for the parameter name.
* The loop keyword lists the actual user names. Those replace the `{{ item }}` during the actual execution of the playbook.
* During execution the task is only listed once, but there are three changes listed underneath it.