---
slug: playbook-inventory
id: roiomuoszv8a
type: challenge
title: 1.0 - The basics & creating an inventory
teaser: Write your inventory, know who Ansible talks to!
notes:
- type: text
  contents: '![image.png](../assets/image.png)'
- type: text
  contents: |-
    ![image.png](../assets/image.png)

    Ansible works against multiple managed nodes or “hosts” in your infrastructure at the same time, using a list or group of lists known as `inventory`. For our first challenge, we are going to create an inventory to be used in the following challenges.
tabs:
- title: VSCode Editor
  type: service
  hostname: control
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel%2Fansible-files
  port: 443
- title: Control
  type: terminal
  hostname: control
- title: controller
  type: service
  hostname: control
  path: /
  port: 443
difficulty: ""
timelimit: 3500
---
💡 Laboratory tips before we begin!
===

Before we begin, some basic tips to improve your lab experience:

1.  The instructions sidebar to the right can be resized (drag and drop the border) or completely collapsed (click on the top left arrow of the sidebar) in case you need extra space for the main panel. You can try this now!
2. In the right sidebar, you will find the different sections. In each chapter, there will be an introduction to the challenge and the related tasks below. The sections can be collapsed and expanded by clicking on them.
![image.png](../assets/image.png)
3. When we refer to the **VSCode Editor** or **Control** tabs, we mean the ones at the top bar. **VSCode Editor** will show the **Visual Studio Code** screen where you can edit the files, and the **Control** one will show a command line interface (CLI) or **terminal** to run the playbooks and checks.
![image.png](../assets/image.png)
4. Each "code box" for playbooks and commands has a copy & paste feature, where if you click on the box, the content will be copied to the clipboard. You can paste this into the VSCode Editor if you run into problems typing.

👋  The basics
===

Welcome to the writing your first Ansible playbook lab!

If you are new to Ansible Automation Platform, in this hands-on laboratory we will guide you on what is an Ansible playbook and how to write one to start your automation journey!

In this first challenge, you will learn about the Ansible command-line tool called `ansible-navigator` and you will also create an `inventory` file.

☑️ Task 1 - What is Ansible Navigator?
===

Ansible navigator is a command-line (CLI) based tool for creating, reviewing, and troubleshooting Ansible content. This includes inventories, playbooks, and collections. In the following challenges you will use the  `ansible-navigator` command to run the Ansible playbooks you create.

☑️ Task 2 - What is an inventory?
===

An `inventory` file is a text file (usually in `.ini` format) that specifices the nodes (remote devices) that will be managed by the control machine (from where we run the automation).

The inventory may include a list of hostnames or IP addresses associated with the managed nodes, depending on the need. The inventory file allows for nodes to be organized into groups by declaring a host group name within square brackets, for ex. `[group]`.

☑️ Task 3 - Creation of an Inventory file
===

In the **VSCode Editor** screen, the directory opened by default in the left panel is ansible-files. This directory will contain our inventory file and future playbooks.

Currently, the only file residing in the `ansible-files` directory is `ansible-navigator.yml`. This file contains all the settings to properly run this lab. Feel free to look at the file, but **please don't make any changes to it**, as we won't cover those settings this time.

 Right click in a blank space below the existing files and create a new file named `inventory`.

> [!NOTE]
> 	The `inventory` filename should have no extension!

![Create File](../assets/create_file.png)

In the `inventory` file, input the following content:

```
[web]
node1
node2
```
> [!NOTE]
> Remember to save the file!


☑️ Task 4 - How to use Ansible Navigator?
===

> [!NOTE]
> Switch to the **Control** top tab for the Terminal

`ansible-navigator` comes with an interactive mode by default that allows you to explore the different options through a Terminal UI, but for this lab, we will set the mode of `ansible-navigator` to `stdout`, the standard output. We have configured this as the default in the `ansible-navigator.yml` settings file.

Change to the `ansible-files` directory

```
cd ansible-files
```
and run the following commands to get a listing of what is available within our recently created `inventory`:

```
ansible-navigator inventory --list
```

The output should look like this:

```
{
    "_meta": {
        "hostvars": {}
    },
    "all": {
        "children": [
            "ungrouped",
            "web"
        ]
    },
    "web": {
        "hosts": [
            "node1",
            "node2"
        ]
    }
}
```

> [!NOTE]
> If the `--list` is too verbose, the option of `--graph` can be used to provide a more condensed version of `--list`.
>
> ```
> ansible-navigator inventory --graph
> ```

In the following challenges you will familarize yourself with the `ansible-navigator run` command that allows us to run Ansible playbooks.


✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-inventory&assignees=rlopez133).

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
