---
slug: roles
id: c2xl7xdzdtbc
type: challenge
title: '1.9 - SUMMIT BONUS: Roles'
teaser: The framework that simplifies writing playbooks
notes:
- type: text
  contents: |-
    An Ansible role has a defined directory structure with eight main standard directories. You must include at least one of these directories in each role. You can omit any directories the role does not use.

    By default Ansible will look in each directory within a role for a main.yml file for relevant content.

    In the following challenge, we will create a role, review the roles tree structure and create an Apache VirtualHost on `node2`.
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
👋 1.9 - SUMMIT BONUS: Roles
===

> [!IMPORTANT]
> BONUS TRACK. Work in progress.

This is a BONUS track for the Red Hat Summit & AnsibleFest 2024 hands-on laboratory. If you complete the lab with the bonus challenges, you can request the "completed lab" badge in the Ansible Forum!

This exercise builds upon the previous exercises and advances your Ansible skills by guiding you through the creation of a role that configures Apache (`httpd`). You'll take the knowledge you learned to now integrate variables, handlers, and a template for a custom index.html. This role demonstrates how to encapsulate tasks, variables, templates, and handlers into a reusable structure for efficient automation.

☑️ Task 1 - Create a Basic Role Directory Structure
===

> [!NOTE]
> In the **Control** tab

Ansible looks for roles in a subdirectory called `roles` in the project directory by default. Each role has its own directory. To ease creation of a new role the tool `ansible-galaxy` can be used.

> [!NOTE]
> Ansible Galaxy is your hub for finding, reusing and sharing Ansible content.

In the `ansible-files` create a `roles` directory.

```
cd ansible-files
```
```
mkdir roles
```
Once the `roles` directory is created, use `ansible-galaxy` to build a role labeled `apache`

```
ansible-galaxy init --offline roles/apache
```

☑️ Task 2 - View apache Role Directory Structure
===

> [!NOTE]
> In the **Control** tab

Use the `tree` command to look at the role directories and their content.

```
tree roles
```
```
roles/
└── apache_vhost
    ├── defaults
    │   └── main.yml
    ├── files
    ├── handlers
    │   └── main.yml
    ├── meta
    │   └── main.yml
    ├── README.md
    ├── tasks
    │   └── main.yml
    ├── templates
    ├── tests
    │   ├── inventory
    │   └── test.yml
    └── vars
        └── main.yml
```


☑️ Task 3 - Edit the roles/apache/vars/main.yml file
===

> [!NOTE]
> In **VSCode Editor** tab

Edit the `ansible-files/roles/apache/vars/main.yml` file

```
---
# vars file for roles/apache
apache_package_name: httpd
apache_service_name: httpd
```


☑️ Task 4 - Edit the tasks/main.yml file
===

Previously we would include all of our tasks within the Ansible playbook itself. With Ansible Roles, we include the tasks within the `roles/apache/tasks/main.yml` file. This file only has the tasks and is not a complete playbook.

For this challenge, the `roles/apache/tasks/main.yml` file includes tasks that do the following:

* Make sure `httpd` is installed
* Make sure `httpd` is started and enabled
* Make sure `firewalld` is installed
* Make sure `firewalld` is started and enabled
* Allow HTTPS traffic on web servers

Edit the `ansible-files/roles/apache/tasks/main.yml` file:

```
---
# tasks file for ansible-files/roles/apache
- name: Install Apache web server
  ansible.builtin.package:
    name: "{{ apache_package_name }}"
    state: present

- name: Ensure Apache is running and enabled
  ansible.builtin.service:
    name: "{{ apache_service_name }}"
    state: started
    enabled: true

- name: Install firewalld
  ansible.builtin.dnf:
    name: firewalld
    state: present

- name: Ensure firewalld is running
  ansible.builtin.service:
    name: firewalld
    state: started
    enabled: true

- name: Allow HTTP traffic on web servers
  ansible.posix.firewalld:
    service: http
    permanent: true
    state: enabled
  when: inventory_hostname in groups['web']
  notify: Reload Firewall
```

> [!IMPORTANT]
> The tasks in the main.yml file start at the beginning of the file (no spacing) and the details of a playbook (hosts, vars, etc) are not present.

☑️ Task 4 - Create the handlers
===

In `ansible-files/roles/apache/handlers/main.yml`, create a handler to restart firewalld if its configuration changes:
```
---
# handlers file for ansible-files/roles/apache
- name: Reload Firewall
  ansible.builtin.service:
    name: firewalld
    state: reloaded

```


☑️ Task 5 - Creating an index.html template file
===

Use a Jinja2 template for a custom `index.html.`
Store the template in the apache role directory.
Edit `ansible-files/roles/apache/templates/index.html.j2`:

```
<html>
<head>
<title>Welcome to {{ ansible_hostname }}</title>
</head>
<body>
 <h1>Hello from {{ ansible_hostname }}</h1>
</body>
</html>
```

☑️ Task 6 - Add the deploy index.html task into the tasks/main.yml file
===

In the `ansible-files/roles/apache/tasks/main.yml` file, add the following task at the end:

> [!IMPORTANT]
> Pay atention to indentation. When pressing enter in VSCode some extra spaces might be added!

```
- name: Deploy custom index.html
  ansible.builtin.template:
    src: index.html.j2
    dest: /var/www/html/index.html

```

☑️ Task 6 - Create a new playbook called `deploy_apache.yml` to use the new `apache` role
===

Create the `deploy_apache.yml` playbook in the `ansible-files` directory with the following content:

> [!IMPORTANT]
> All we need to do to use our role is call it under the `roles:` declarative with its name `apache`

```
- name: Setup Apache Web Servers
  hosts: web
  become: true
  roles:
    - apache
```



☑️ Task 9 - Run Ansible playbook
===

> [!NOTE]
> In the **Control** tab

```
ansible-navigator run deploy_apache.yml
```

☑️ Task 10 - Verify the results
===

Once the playbook has completed, verify that httpd is indeed running on all the web nodes.

Check node1:
```
ssh node1 "systemctl status httpd"
```

```
curl http://node1
```

```
ssh node2 "systemctl status httpd"
```
```
curl http://node2
```


✅ Congratulations!
===
Congratulations! You've completed the track Writing your First Playbook!

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+roles&assignees=rlopez133).

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
