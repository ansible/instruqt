---
slug: playbook-templates
id: aalzmqyb5tjq
type: challenge
title: '1.8 - SUMMIT BONUS: Templates'
teaser: Templates give the power to create multiple host specific configuration from
  the same file.
notes:
- type: text
  contents: Ansible uses [Jinja2](http://jinja.pocoo.org/) templating to modify files
    before they are distributed to managed hosts. Jinja2 is one of the most used template
    engines for Python.
- type: text
  contents: When a template for a file has been created, it can be deployed to the
    managed hosts using the template module, which supports the transfer of a local
    file from the control node to the managed hosts.
- type: text
  contents: A typical ending for a file to indicate that it is a template file is
    `.j2`. Though this is strictly speaking not necessary, it is established practice.
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
👋 1.8 - SUMMIT BONUS: Templates
===

> [!IMPORTANT]
> BONUS TRACK. Work in progress.

This is a BONUS track for the Red Hat Summit & AnsibleFest 2024 hands-on laboratory. If you complete the lab with the bonus challenges, you can request the "completed lab" badge in the Ansible Forum!

In this challenge, you will create a Jinja2 template. Ansible uses Jinja2 templating to modify files before they are distributed to managed hosts. Jinja2 is one of the most used template engines for Python (http://jinja.pocoo.org/). You'll learn how to craft templates that incorporate host-specific data, enabling the creation of tailored configuration files for each managed host.

In the following example, let's create a template for the Message of the Day (MOTD) that includes dynamic host information.


☑️ Task 1 - Create a templates directory
===

> [!NOTE]
> In the *VSCode Editor* tab

In the `ansible-files` directory, create the  `templates` subdirectory (right click and select 'New Folder' in VSCode) to store our new template files.

☑️ Task 2 - Create the motd.j2 jinja file
===

Template files end with a `.j2` file extension and mix static content with dynamic placeholders enclosed in curly braces `{{ }}`.

Within the `ansible-files/templates` directory, create the file `motd.j2` with the following content:

> [!NOTE]
> You can right-click over the `templates`  directory in VSCode and use "New File".

```
Welcome to {{ ansible_hostname }}.
OS: {{ ansible_distribution }} {{ ansible_distribution_version }}
Architecture: {{ ansible_architecture }}
```

The template file contains the basic text that will later be copied over to the hosts. It contains variables that will be replaced on the target machines individually. It will dynamically display the hostname, OS distribution, version, and architecture of each managed host.

☑️ Task 3 - Update the system_setup.yml playbook to include the motd
===

> [!NOTE]
> In the **VSCode Editor** tab


Open the `system_setup.yml` playbook and modify it to include the following task right before the `handlers` section:

> [!WARNING]
> We are only showing the task to add. Pay atention to the indentation and maintain the same format as the other tasks, leave a blank line above and a blank line below the task!

```

    - name: Update MOTD from Jinja2 Template
      ansible.builtin.template:
        src: templates/motd.j2
        dest: /etc/motd

```

> [!IMPORTANT]
> If you run into issues adding the task, you will find the full `system_setup.yml` playbook at the end of this sidebar. Look for the **💡 Solution playbook** section.


☑️ Task 4 - Run the playbook
===

> [!NOTE]
> In the **Control** tab

Run the `system_setup.yml` playbook again:

```
cd ansible-files
```
```
ansible-navigator run system_setup.yml
```

☑️ Task 5 - Verify message of the day
===

Login to `node1` via SSH and check the message of the day content.

```
ssh node1
```

You should see a message similar to the one below (RHEL version might vary!)

```
Welcome to node1.
OS: RedHat 9.2
Architecture: x86_64
Register this system with Red Hat Insights: insights-client --register
Create an account or view all your systems at https://red.ht/insights-dashboard
```

You can now exit node1:

```
exit
```
💡 Solution playbook
===

```
---
- name: Basic System Setup
  hosts: all
  become: true
  vars:
    user_name: 'padawan'
    package_name: httpd
    apache_service_name: httpd
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

    - name: Ensure Apache is running and enabled
      ansible.builtin.service:
        name: "{{ apache_service_name }}"
        state: started
        enabled: true
      when: inventory_hostname in groups['web']

    - name: Install firewalld
      ansible.builtin.dnf:
        name: firewalld
        state: present
      when: inventory_hostname in groups['web']

    - name: Ensure firewalld is running
      ansible.builtin.service:
        name: firewalld
        state: started
        enabled: true
      when: inventory_hostname in groups['web']

    - name: Allow HTTP traffic on web servers
      ansible.posix.firewalld:
        service: http
        permanent: true
        state: enabled
      when: inventory_hostname in groups['web']
      notify: Reload Firewall

    - name: Update MOTD from Jinja2 Template
      ansible.builtin.template:
        src: templates/motd.j2
        dest: /etc/motd

  handlers:
    - name: Reload Firewall
      ansible.builtin.service:
        name: firewalld
        state: reloaded
```

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-templates&assignees=rlopez133).

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
