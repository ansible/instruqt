---
slug: playbook-files
id: ygraurb2blog
type: challenge
title: 'Extend the playbook more: copy files'
teaser: 'Let''s do more with our automation: manage files!'
notes:
- type: text
  contents: Besides pure interactions on the target node there is also the possibility
    to copy data between the controlling instance and the managed nodes. The copy
    module can be used to transfer data.
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
#### Estimated time to complete: *8 minutes*<p>
In this challenge, you will create a simple webpage labeled `web.html` and display its contents via a `curl` command.

☑️ Task 1 - Creation of the Files directory
===
* The *editor* tab is open by default.

In the editor, create a file directory `files` underneath the directory `ansible-files`. This is done by right clicking and selecting `New Folder`.


☑️ Task 2 - Creation of the web.html file
===

Inside the `files` directory, right click and select 'New File' to create an HTML file labeled `web.html` with the following content:

```
<body>
<h1>Apache is running fine, thanks to Ansible!</h1>
</body>
```

☑️ Task 3 - Updating the apache.yml
===

Within the `apache.yml` file use the `ansible.builtin.copy` module to copy the `web.html` file to the `/var/www/html/index.html` within the `node1` host.

>### **❗️ WARNING ❗️**
>Make sure that the task is indented the same way as the previous task!


```
  - name: copy web.html
    ansible.builtin.copy:
      src: web.html
      dest: /var/www/html/index.html
```

Notice that the source does not mention the directory `files`! The `files` directory is a default location to store ansible files you wish to provide to hosts you are managing.


☑️ Task 4 - Run the apache.yml playbook
===

Within the *control* tab, change to the directory `ansible-files` and execute the playbook again:

```
cd ansible-files
```
```
ansible-navigator run apache.yml
```

☑️ Task 5 - Verify the content of the web.html on node1
===

A `curl` command accessing the `index.html` (default page) of the Apache `node1` can be done as follows:

```
curl http://node1
```

```
<body>
    <h1>Apache is running fine, thanks to Ansible!</h1>
    </body>
```

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-files&assignees=rlopez133)

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