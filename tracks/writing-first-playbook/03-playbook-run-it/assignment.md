---
slug: playbook-run-it
id: 4wjwp5ghyknf
type: challenge
title: Run it!
teaser: See how it works!
notes:
- type: text
  contents: |-
    In the last challenge we created the playbook. Now it is time to launch it!

    We do this with the command `ansible-navigator` - one of the central commands of Ansible on the command line!
- type: text
  contents: During the task you might be wondering how `ansible-navigator` actually
    knows where to find the `hosts` file - this is configured in the file `/home/rhel/ansible-files/ansible-navigator.yml`
    which was pre-created in this environment. If you have time have a look at it,
    it should be fairly self-explanatory.
tabs:
- title: control
  type: terminal
  hostname: control
difficulty: basic
timelimit: 1
---
👋 Introduction
===
#### Estimated time to complete: *5 minutes*<p>
In this challenge, you will execute an Ansible Playbook from the control node using the `ansible-navigator` tool.

☑️ Task 1 - Run the apache.yml Ansible Playbook
===
* The *control* tab is open by default.

Within the *control* tab, change into the `ansible-files` directory:

```
cd ansible-files
```

Run the playbook:

```
ansible-navigator run apache.yml
```
>### **❗️ WARNING**
>The playbook task may take a minute or two to complete as it is populating the repository metadata for the first time.

>### **❗️ Note**
>`-i hosts` option is not required as the `ansible-navigator.yml` file has already set the default location of the inventory.

The output should not report any errors but provide an overview of the tasks executed and a play recap summarizing what has been done.

```
ansible-navigator run apache.yml
```
```
PLAY [Apache server installed] *************************************************

TASK [Gathering Facts] *********************************************************
ok: [node1]

TASK [latest Apache version installed] *****************************************
changed: [node1]

PLAY RECAP *********************************************************************
node1                      : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
There is a built-in task labeled `Gathering Facts` that runs automatically at the beginning of each Ansible play. It collects information about the managed nodes.

Upcoming challenges will cover this in more detail.

☑️ Task 2 - Verify Apache installed
===

The `apache.yml` playbook installs Apache (`httpd` package) on the host `node1`. A simple method to verify the results that the package did indeed install, is to use an Ansible ad-hoc command to verify the results.

```
ansible node1 -m ansible.builtin.shell -a "rpm -qi httpd"
```

```
node1 | CHANGED | rc=0 >>
Name        : httpd
Version     : 2.4.37
Release     : 47.module+el8.6.0+15654+427eba2e.2
Architecture: x86_64
Install Date: Thu 28 Jul 2022 12:25:23 AM UTC
Group       : System Environment/Daemons
Size        : 4499603
License     : ASL 2.0
Signature   : RSA/SHA256, Thu 16 Jun 2022 11:39:02 AM UTC, Key ID 199e2f91fd431d51
Source RPM  : httpd-2.4.37-47.module+el8.6.0+15654+427eba2e.2.src.rpm
Build Date  : Wed 15 Jun 2022 12:27:53 PM UTC
Build Host  : x86-64-02.build.eng.rdu2.redhat.com
Relocations : (not relocatable)
Packager    : Red Hat, Inc. <http://bugzilla.redhat.com/bugzilla>
Vendor      : Red Hat, Inc.
URL         : https://httpd.apache.org/
Summary     : Apache HTTP Server
Description :
The Apache HTTP Server is a powerful, efficient, and extensible
web server.
```

This uses the module (-m) `ansible.builtin.shell` with module arguments (-a) that states to run the following command `rpm -qi httpd` on `node1`.

The output lists the name, version and other details about the package.



☑️ Task 3 - Idempotency at work
===

Run the Ansible Playbook a second time and compare the output to the original. You will notice the tasks change from `changed` to `ok` including the colors changing from `yellow` to `green`. Additionally, the *PLAY RECAP* is different as well making it easier to spot the changes made by Ansible.

```
ansible-navigator run apache.yml
```

```
PLAY [Apache server installed] *************************************************

TASK [Gathering Facts] *********************************************************
ok: [node1]

TASK [latest Apache version installed] *****************************************
ok: [node1]

PLAY RECAP *********************************************************************
node1                      : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

Why does this happen?

Due to idempotency. The Ansible Playbook can be run numerous times but only does it make a change the first time due to this being the only time that `node1` does not have the `httpd` package installed. Once the package is installed, Ansible recognizes this and gives a status of *ok* letting us know that indeed the package is present.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-run-it&assignees=rlopez133)

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