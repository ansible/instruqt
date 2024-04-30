---
slug: playbook-directory-structure
id: 3vtxsog4rhej
type: challenge
title: 1.1 - Creating your first Playbook
teaser: Write the first playbook
notes:
- type: text
  contents: |-
    ![image.png](../assets/image.png)

    Playbooks are files which describe the desired configurations or steps to implement on managed hosts. Playbooks can change lengthy, complex administrative tasks into easily repeatable routines with predictable and successful outcomes.

    A playbook can have multiple plays and a play can have one or multiple tasks. In a task, a module is called to run an action against. The goal of a play is to map a group of hosts. The goal of a task is to implement modules against those hosts.
- type: text
  contents: |-
    ![image.png](../assets/image.png)

    Playbooks are text files written in YAML format and therefore need:

    * to start with three dashes (---)
    * proper indentation using spaces and not tabs!

    There are some important concepts:

    * `hosts`: the managed hosts to perform the tasks on
    * `tasks`: the operations to be performed by invoking Ansible modules and passing them the necessary options.
    * `become`: privilege escalation in Playbooks, same as using -b in the ad hoc command.
- type: text
  contents: Good Playbooks are idempotent, so if a Playbook is run once to put the
    hosts in the correct state, it should be safe to run it a second time and it should
    make no further changes to the hosts.
tabs:
- title: VSCode Editor
  type: service
  hostname: control
  path: /editor/
  port: 443
difficulty: basic
timelimit: 1
---
👋 1.1 - Creating your first Playbook
===

Playbooks in Ansible are essentially scripts written in YAML, a text markup language (if you know HTML, that's another markup language!). They are used to define the tasks and configurations that Ansible will apply to your servers.

In this challenge, you'll use Ansible to conduct basic system setup tasks on a Red Hat Enterprise Linux server. You will become familiar with Ansible fundamentals, like what is a playbook, how to create one and how to use modules like `dnf` and `user`.


☑️ Task 1 - Creation of the system_setup.yml file
===

> [!NOTE]
> In the *VSCode Editor* tab

We are going to create a playbook named `system_setup.yml` to perform, you guessed it, a basic system setup:
* Update all security related packages.
* Create a new user named ‘student’.

Within the **VSCode Editor** tab, you should be in the `ansible-files` directory.
In that directory, right click and create the file `system_setup.yml`.

☑️ Task 2 - Defining the  system_setup.yml playbook
===

The following content is how a playbook starts:

```
---
- name: Basic System Setup
  hosts: node1
  become: true
  tasks:

```

> [!IMPORTANT]
> A couple of things to keep in mind when creating Ansible YAML files:
> * Start with three dashes (`---`) to indicate this is a playbook
> * Indentation is mandatory: Use spaces, not tabs, for indentation.
> * In YAML we need to use 2 spaces per level of indentation. Notice how the `hosts` line begins with 2 spaces.

One of Ansible's strengths is the ease to read and understand the flow of a playbook.
What are the above lines doing?

* **name**: A descriptive name is given for the play (the group of tasks) via `name:`. This is optional but recommended.
* **hosts**:The servers or devices to run the playbook against is defined via `hosts:`. This can be a single host or group from the inventory file.
* **become**: We enable user privilege escalation (sudo) with `become: true`.
* **tasks**: We start the tasks block for this play




☑️ Task 3 - Adding tasks to the system_setup.yml playbook
===

Now that we know how a playbook file starts, let's look at the plays. Let's add a couple of tasks to update all installed packages on our `node1` host and to create a user. We will take advantage of the `ansible.builtin.dnf` module to apply all security-related updates to installed packages.

Modify the `system_setup.yml` file to add the 2 tasks, as shown below:

> [!WARNING]
> Pay atention to indentation and the spaces

```
---
- name: Basic System Setup
  hosts: node1
  become: true
  tasks:
    - name: Install security updates for the kernel
      ansible.builtin.dnf:
        name: 'kernel'
        state: latest
        security: true

    - name: Create a new user
      ansible.builtin.user:
        name: myuser
        state: present
        create_home: true
```

Once we've done our play declarations, we start off with a `tasks` declaration to incorporate what specific tasks we'd like Ansible to automate within this play.

* The modules in use are:
  * `ansible.builtin.dnf`: This module is used for package management with DNF (Dandified YUM), the `yum` replacement on newer RHEL and other Fedora or CentOS-based systems. If managing RHEL 7 for example, you could use the `ansible.builtin.yum` module instead.
  * `ansible.builtin.user`: This module is used to manage user accounts in the system.

* A task is named (`name`) and a module (`ansible.builtin.dnf` and `ansible.builtin.user`) are called for the task.
* Parameters for the modules are added:
  * `name`: to identify the package or user name
  * `state`: to define the wanted state (`present`, `absent`, `latest`)
  * `security: true`: this one is `dnf` specific, to define that updates should be security only
  * `create_home`: this one is `user` specific, requests the module to create a home for the user



✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-directory-structure&assignees=rlopez133).

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
