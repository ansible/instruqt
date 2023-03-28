---
slug: roles
id: xo6dnwm8yumf
type: challenge
title: Roles
teaser: The framework that simplifies writing playbooks
notes:
- type: text
  contents: |-
    An Ansible role has a defined directory structure with eight main standard directories. You must include at least one of these directories in each role. You can omit any directories the role does not use.

    By default Ansible will look in each directory within a role for a main.yml file for relevant content.

    In the following challenge, we will create a role, review the roles tree structure and create an Apache VirtualHost on `node2`.
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
While it is possible to write a playbook in one file as we've done throughout these challenges, eventually you’ll want to reuse files and start to organize things. In this challenge, you will create an Ansible Role that creates an Apache VirtualHost on a specified node.

☑️ Task 1 - Create a Basic Role Directory Structure
===

Ansible looks for roles in a subdirectory called `roles` in the project directory. This can be overridden in the Ansible configuration. Each role has its own directory. To ease creation of a new role the tool `ansible-galaxy` can be used.

>### **💡 Tip**
>Ansible Galaxy is your hub for finding, reusing and sharing Ansible content. `ansible-galaxy` helps to interact with Ansible Galaxy. For now we'll just using it as a helper to build the directory structure.

Within the *control* tab, under `ansible-files` create a `roles` directory.

```
cd ansible-files
```
```
mkdir roles
```
Once the `roles` directory is created, use `ansible-galaxy` to build a role labeled `apache_vhost`

```
ansible-galaxy init --offline roles/apache_vhost
```

☑️ Task 2 - View apache_vhost Role Directory Structure
===

Within the *control* tab, use the `tree` command to look at the role directories and their content.

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

☑️ Task 3 - Edit the tasks/main.yml file
===

Previously we would include all of our tasks within the Ansible playbook itself. With Ansible Roles, we include the tasks within the `tasks/main.yml` file. This file only has the tasks and is not a complete playbook.

For this challenge, the `main.yml` file includes tasks that do the following:

* Make sure `httpd` is installed
* Make sure `httpd` is started and enabled
* Put HTML content into the Apache document root
* Install the template provided to configure the vhost

Edit the `roles/apache_vhost/tasks/main.yml` file:

```
---
# tasks file for roles/apache_vhost
- name: install httpd
  ansible.builtin.package:
    name: httpd
    state: latest

- name: start and enable httpd service
  ansible.builtin.service:
    name: httpd
    state: started
    enabled: true
```
>### **❗️ Note**
>The tasks in the main.yml file start at the beginning of the file (no spacing) and the details of a playbook (hosts, vars, etc) are not present.

The tasks added so far do:

* Install the `httpd` package using the `ansible.builtin.package` module
* Use the `ansible.builtin.service` module to enable and start `httpd`

☑️ Task 4 - Add further tasks into the tasks/main.yml file
===

Next we add three more tasks to ensure a vhost directory structure, copy the html content to the index.html file of the hosts, and use the template module to create the vhost configuration from a jinja2 template.

```
- name: ensure vhost directory is present
  ansible.builtin.file:
    path: "/var/www/vhosts/{{ ansible_hostname }}"
    state: directory

- name: deliver html content
  ansible.builtin.copy:
    src: web.html
    dest: "/var/www/vhosts/{{ ansible_hostname }}/index.html"

- name: template vhost file
  template:
    src: vhost.conf.j2
    dest: /etc/httpd/conf.d/vhost.conf
    owner: root
    group: root
    mode: 0644
  notify:
    - restart_httpd
```

Did you notice the handler (`restart_httpd`)?

☑️ Task 5 - Create the restart_httpd handler
===

Within the `roles/apache_vhost/handlers/main.yml` add the contents to the `restart_httpd` handler task.

```
---
# handlers file for roles/apache_vhost
- name: restart_httpd
  service:
    name: httpd
    state: restarted
```

☑️ Task 6 - Create a web.html file
===

Create the HTML content that will be served by the webserver.

Create an `web.html` file in the "src" directory of the role, `files`:

```
echo 'simple vhost index' > ~/ansible-files/roles/apache_vhost/files/web.html
```
☑️ Task 7 - Create a vhost template file
===

Create the `vhost.conf.j2` template file in the role's templates subdirectory (`~/ansible-files/roles/apache_vhost/templates`).

```
# {{ ansible_managed }}

<VirtualHost *:8081>
    ServerAdmin webmaster@{{ ansible_fqdn }}
    ServerName {{ ansible_fqdn }}
    ErrorLog logs/{{ ansible_hostname }}-error.log
    CustomLog logs/{{ ansible_hostname }}-common.log common
    DocumentRoot /var/www/vhosts/{{ ansible_hostname }}/

    <Directory /var/www/vhosts/{{ ansible_hostname }}/>
  Options +Indexes +FollowSymlinks +Includes
  Order allow,deny
  Allow from all
    </Directory>
</VirtualHost>
```

☑️ Task 8 - Create an Ansible playbook
===

With our role complete, create an Ansible playbook that runs against the role and verifies everything worked as expected.

Within the *editor* tab, create a file labeled `test_apache_role.yml` in the directory `ansible-files`.

>### **❗️ NOTE**
>Ensure to click the refresh button to see all the newly created directories and files.

```
---
- name: use apache_vhost role playbook
  hosts: node2
  become: true
  roles:
    - apache_vhost
```
>### **❗️ Note**
>All we need to do to use our role is call it under the `roles:` declarative with its name `apache_vhost`. Additional roles can be added to the list if available.

☑️ Task 9 - Run Ansible playbook
===

Witin the *control* tab, run the following commands:

```
ansible-navigator run test_apache_role.yml
```

☑️ Task 10 - Verify the results
===

The Ansible playbook runs the role against the `node2` host. Verify that the role worked via a `curl` command to check if the webpage with contents `simple vhost index` displays correctly.

```
curl -s http://node2:8081
```
```
simple vhost index
```

Congratulations! You've completed the track Writing your First Playbook!

Feel free to head to the next challenge and explore!

✅ Next Challenge
===
Press the `Check` button below to go to the playground.

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
