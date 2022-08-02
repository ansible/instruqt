---
slug: playbook-variables
id: ud5t6go9cbs0
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
#### Estimated time to complete: *10 minutes*<p>
In this challenge, you will familarize yourself with the use of variables specified in different locations `group_vars` and `host_vars`. Each location provides different behavior.

☑️ Task 1 - Creation of variable directories
===

In this task you will create two directories within `ansible-files`, `group_vars` and `host_vars`. Right click and select 'New Folder' to create each of them.

The objective is to save different variables for specified hosts and for an entire group.

☑️ Task 2 - Creation the group_vars/web.yml file
===

Create the file  `~/ansible-files/group_vars/web.yml` with the following content:

```
---
stage: dev
```

The `group_vars/web.yml` file provides the value `dev` to a variable labeled `stage`.

☑️ Task 3 - Creation the host_vars/node1.yml file
===

Create the file `~/ansible-files/host_vars/node1.yml` with the following content:

```
---
stage: prod
```

The `host_vars/node1.yml` file provides the value `prod` to a variable labeled `stage`.

☑️ Task 4 - Creation of the web.html stage files
===

Depending on the stage variable that is selected, the Ansible playbook shall copy a different web.html file.

Let's create two stage files. First the file `~/ansible-files/files/prod_web.html` with the content:

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

☑️ Task 5 - Modify the apache.yml playbook using the stage variable
===

Modify the copy task of the existing `apache.yml` playbook as follows:

```
  - name: copy web.html
    ansible.builtin.copy:
      src: "{{ stage }}_web.html"
      dest: /var/www/html/index.html
```

☑️ Task 6 - Run the apache.yml playbook
===

Within the *control* tab, run the playbook:

```
cd ansible-files
```

```
ansible-navigator run apache.yml
```

☑️ Task 7 - Verify Results
===

The `node1` server should point to the production web page. The `node2` server should point to the development web page.

```
curl http://node1
```
```
<body>
    <h1>This is a production webserver, take care!</h1>
    </body>
```

```
curl http://node2
```

```
<body>
    <h1>This is a development webserver, have fun!</h1>
    </body>
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
    width: 100%;
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