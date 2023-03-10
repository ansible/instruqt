---
slug: handlers
id: mfb2s0ty0ymb
type: challenge
title: Handlers
teaser: Don't forget to notify!
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
#### Estimated time to complete: *5 minutes*<p>
In this challenge, you will use a handler to notify a restart of Apache when changes to an `httpd.conf` file have taken place.


☑️ Task 1 - Create a new playbook
===
* The *editor* tab is open by default.

Open the *editor* tab, and create the file `httpd_conf.yml`. This can be done by simply right clicking and selecting 'New File'.

Within the `httpd_conf.yml`, add the following content. The following playbook manages Apache's configuration file `/etc/httpd/conf/httpd.conf` on all hosts within the `web` group. It then restarts Apache when the file has changed.

```
---
- name: manage httpd.conf
  hosts: web
  become: true
  tasks:
  - name: Copy Apache configuration file
    copy:
      src: httpd.conf
      dest: /etc/httpd/conf/
    notify:
      - restart_apache
  handlers:
    - name: restart_apache
      service:
        name: httpd
        state: restarted
```

Understanding the playbook:

* The `notify` section calls the handler only when the copy task actually changes the file. That way the service is only restarted if needed - and not each time the playbook is run.

* The `handlers` section defines a task that is only run on notification.

☑️ Task 2 - Copy the httpd.conf file to control node
===

Within the *control* tab, copy the `/etc/httpd/conf/httpd.conf` file from `node1` to the `/home/rhel/ansible-files/files/` location.

```
scp node1:/etc/httpd/conf/httpd.conf /home/rhel/ansible-files/files/.
```

☑️ Task 3 - Run the httpd_conf.yml playbook
===

Within the *control* tab, change directory to `ansible-files` and run the `httpd_conf.yml` playbook.

```
cd ansible-files
```

```
ansible-navigator run httpd_conf.yml
```
```
```

Notice anything with the output?

Nothing was changed, thus the playbook ran and you will notice the PLAY RECAP does not show any `changed` lines.

☑️ Task 4 - Modify the httpd.conf file
===

Within the *editor* tab, modify the `ansible-files/files/httpd.conf` and change the `Listen 80` line in `ansible-files/files/httpd.conf` to:

```
Listen 8081
```

>### **❗️ Note**
>You may need to refresh via the refresh explorer button for the file to show within the editor.

☑️ Task 5 - Run the httpd_conf.yml playbook
===

Within the *control* tab, run the playbook again.

```
ansible-navigator run httpd_conf.yml
```
```
```

Now the Ansible playbook output should be a lot more interesting:

* `httpd.conf` should have been copied over
* The handler should have restarted Apache

☑️ Task 6 - Verify Apache listening on port 8081
===

Within the *control* tab, run the following `curl` command

```
curl http://node1
```

```
curl: (7) Failed to connect to node1 port 80: Connection refused
```

```
curl http://node1:8081
```
```
<body>
<h1>This is a production webserver, take care!</h1>
</body>
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