---
slug: playbook-variables
id: e3xklbivgoei
type: challenge
title: Adding variables to the mix
teaser: Ansible supports variables to store values that can be used in Playbooks.  Let's
  do this.
notes:
- type: text
  contents: Ansible supports variables to store values that can be used in Playbooks.
    Variables can be defined in a variety of places and have a clear precedence. Ansible
    substitutes the variable with its value when a task is executed.
- type: text
  contents: |-
    Variables are referenced in Ansible Playbooks by placing the variable name in double curly braces:

    ```
    Here comes a variable {{ variable1 }}
    ```
- type: text
  contents: 'Variables and their values can be defined in various places: the inventory,
    additional files, on the command line, etc.'
- type: text
  contents: |-
    The recommended practice to provide variables in the inventory is to define them in files located in two directories named `host_vars` and `group_vars`:

    * To define variables for a group “servers”, a YAML file named `group_vars/servers.yml` with the variable definitions is created.
    * To define variables specifically for a host node1, the file `host_vars/node1.yml` with the variable definitions is created.
- type: text
  contents: Host variables take precedence over group variables (more about precedence
    can be found in the [docs](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable)).
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
We want to save variables for certain hosts, and for the full group.

In the editor, in the directory `ansible-files`, create two directories, `group_vars` and `host_vars`:

We are going to set values for the variable `stage`. Create the file `~/ansible-files/group_vars/web.yml` with this content:

```
---
stage: dev
```

Create the file `~/ansible-files/host_vars/node1.yml` with this content:

```
---
stage: prod
```

Based on the stage, the playbook should copy a different file. Let's create two stage files. First the file `~/ansible-files/files/prod_web.html` with the content:

```
<body>
<h1>This is a production webserver, take care!</h1>
</body>
```

Second create the file `~/ansible-files/files/dev_web.html` with the content:

```
<body>
<h1>This is a development webserver, have fun!</h1>
</body>
```

Modify the copy task of the existing `apache.yml` playbook to this:

```
  - name: copy web.html
    ansible.builtin.copy:
      src: "{{ stage }}_web.html"
      dest: /var/www/html/index.html
```

On the control host, run the playbook:

```
cd ansible-files
ansible-navigator run apache.yml -i hosts
```

Test and compare the results:

```
curl http://node1
curl http://node2
```