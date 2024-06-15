---
slug: handlers
id: hl6iyxdexrwh
type: challenge
title: 1. 6 - Handlers
teaser: Something changed, let's reload the service!
notes:
- type: text
  contents: Sometimes when a task does make a change to the system, an additional
    task or tasks may need to be run. For example, a change to a service’s configuration
    file may then require that the service be restarted so that the changed configuration
    takes effect.
- type: text
  contents: Here Ansible’s handlers come into play. Handlers can be seen as inactive
    tasks that only get triggered when explicitly invoked using the "notify" statement.
tabs:
- title: VSCode Editor
  type: service
  hostname: control
  path: /editor/
  port: 443
- title: control
  type: terminal
  hostname: control
- title: Node1 Web
  type: service
  hostname: node1
  path: /
  port: 80
difficulty: ""
timelimit: 1
---
👋 1. 6 - Handlers
===

Handlers are used for tasks that should only run when notified by another task. Typically, they are used to restart services after a configuration change.

Let's say we want to ensure the firewall is configured correctly on all web servers and then reload the firewall service to apply any new settings. We'll define a handler that reloads the firewall service and is notified by a task that ensures the desired firewall rules are in place:

☑️ Task 1 - Extend the system_setup.yml playbook to add the firewall tasks
===

> [!NOTE]
>  In the *VSCode Editor* tab

Open the *Editor* tab, and edit the `system_setup.yml` playbook. Make sure you add the new tasks below related to the firewall. Remember to check the indentation!

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

  handlers:
    - name: Reload Firewall
      ansible.builtin.service:
        name: firewalld
        state: reloaded
```

Understanding the playbook:
* The `notify` section calls the handler only if the "**Allow HTTP traffic on web servers**" task makes any changes in one of the hosts. That way the service is only reloaded if needed - and not each time the playbook is run.
* The `handlers` section defines a task that is only run on notification. And the `name` field is used to call it from a task.

> [!WARNING]
> Notice how the `name` of the `handlers`  is used within the `notify` section of the **“Allow HTTP traffic on web servers”** configuration task. This ensures that the proper handler is executed as there can be multiple handlers within an Ansible playbook.


☑️ Task 2 - Run the system_setup.yml playbook
===

> [!NOTE]
> In the **Control** tab

Change directory to `ansible-files` and run the playbook:

```
cd ansible-files
```

```
ansible-navigator run system_setup.yml
```




☑️ Task 3 - Run the system_setup.yml playbook again to test the handler
===

> [!NOTE]
> In the **Control** tab

Run the playbook again.

```
ansible-navigator run system_setup.yml
```

Notice anything with the output?

Nothing was changed, thus the playbook ran and you will notice the PLAY RECAP does not show any `changed` lines. The firewall was not restarted as there was no changes.



☑️ Task 6 - Verify Apache listening on port 80
===

> [!NOTE]
> Check the new **Node1 Web** tab at the top, next to the **Control** one.

You should see the following webpage:

**INSERT WEBPAGE IMAGE**

> [!NOTE]
> Alternatively, check in the CLI. The output would be too long so we are greping:

```
curl http://node1 | grep "HTTP Server"
```

Now let's try with `node3`, the server in the `[database]` group:

```
curl http://node3
```
The output should look like this:
```
curl: (7) Failed to connect to node3 port 443: Connection refused
```


✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+handlers&assignees=rlopez133).

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
