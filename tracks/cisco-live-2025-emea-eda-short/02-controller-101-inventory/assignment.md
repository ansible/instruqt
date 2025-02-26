---
slug: controller-101-inventory
id: ixcnc1cbadio
type: challenge
title: '2 - Automation Execution: Reviewing our automation content'
teaser: A quick overview of the inventory, projects, credentials, job templates and
  workflows we will be using in the lab
notes:
- type: text
  contents: |-
    # Inventories

    ![Oct-16-2024_at_02.39.15-image.png](../assets/Oct-16-2024_at_02.39.15-image.png)

    An inventory defines the hosts and groups of hosts upon which commands, modules, and tasks in a playbook operate.
- type: text
  contents: |-
    # Inventories, create new inventory

    ![Oct-16-2024_at_02.39.47-image.png](../assets/Oct-16-2024_at_02.39.47-image.png)

    In this challenge, we will be creating a new inventory, adding hosts and creating a host group inside the inventory.
tabs:
- id: ur2mwijdnglq
  title: AAP
  type: service
  hostname: control
  port: 443
- id: obacntwoauip
  title: gitea
  type: service
  hostname: gitea
  path: /
  port: 3000
difficulty: ""
timelimit: 0
enhanced_loading: null
---
In this chapter we will go over the settings we have configured around Automation Execution (also known as Automation controller).

☑️ Task 1 - Check the Inventories
===

An **inventory** in Ansible Auomation Platform is a collection of hosts against which jobs (i.e. playbooks) may be launched, the same as an Ansible inventory file when using the command line. It indicates which nodes will be managed by the control machine, in this case the Automation Execution controller.

**Inventories** may be divided into *groups* and these groups contain the actual *hosts*. The *hosts* may be sourced manually or dynamically and can be referenced by their **IP addresses** or their **hostnames**.

With **Automation Execution (Automation controller)** you will be able to run multiple playbooks against these inventories without recreating them.

1. Go to the [button label="AAP"](tab-0) tab.
2. On the left side-bar, click the **Automation Execution** menu option.
3. Now click the **Infrastructure** section to expand it and click on **Inventories**
4. Review the `NetOps Inventory` that was created for this lab.
5. Look at the **Groups** and **Hosts** tabs  where you will find the `[cisco]` group with 3 hosts: `cat1`, `cat2`, `cat3`


☑️ Task 2 - Check the Projects
===

A **Project** in Automation Execution *(formerly Automation controller)* are one or more Ansible playbooks (and related roles, etc.) inside a directory. Usually, they are in a Source Control Management system like a **Git** repository. We use **Projects** to "*import*" our playbooks into Ansible Automation Platform.

In this challenge, you will create your first **Project** and import from the provided Git repository `aap_workshop`. This repository is provided by a local Gitea server we have installed as part of the lab and you can find it's web based user interface in the Gitea tab.

1. In the **Automation Execution** section in the sidebar menu.
2. Click the **Projects** link in the menu.
3. Explore the `NetOps Playbooks` project  that was created for this lab.
4. You can check it's details clicking on it


☑️ Task 3 - Check the Credentials
===

**Credentials** are utilized by Ansible Automation Platform for authentication when launching jobs against devices or managed nodes, synchronizing with inventory sources, and importing project content from a version control system.

Credentials are imported and stored encrypted within Ansible Automation Platform, and are not retrievable in plain text on the command line by any user. You can grant users and teams the ability to use these credentials, without actually exposing the credential to the user itself.

There are multiple types of credential types, ranging from tokens, to user/passwords or public keys. In total, there are over 20 supported types and in case something is not covered, we  have the option to create a *Custom credential type*. We will explore the **Machine** credential type today, which we will use to connect to the servers in our inventory through SSH.

1. In the sidebar, expand the **Automation Execution** section.
2. Now expand the **Infrastructure** menu and click the **Credentials** option.

  ![credentials](../assets/aap_credentials.png)

3. This will display a searchable list of pre-loaded credentials, classified by name and type.
4. Look for the `cat8000v-credential`, notice it says **Machine** type. Click on it.

  ![cat8000v credential](../assets/cat8000v_credential.png)
5. Here you can see the details of the credential. Notice the **SSH Private Key** field says **Encrypted**.
6. We are going to be using the same credential for all 3 devices in the `cisco` group, but you could have one credential per each host
7. Inside this view, click the tab **Job Templates** to see what Ansible playbooks are currently using this credential. It should be empty right now.

☑️ Task 4 - Job Templates
===

In Ansible Automation Platform a **Job Template** is a definition and set of parameters for running an Ansible playbook. Job Templates are useful to execute the same job many times while also encouraging the reuse of Ansible content and collaboration between teams.

To create a **Job Template** you need to have a **Project** (a repository or directory) from which to source our *Playbooks*. We created our **Project** called `NetOps Playbooks` in the previous challenge. Also, note that although a **Project** might contain multiple *Playbooks*, a **Job Template** can only run one of those playbooks.

> [!WARNING]
> **Do not confuse a Job Template with a Jinja template**. Jinja templates are used to create dynamic template files, with variables and facts that will be replaced during runtime. This is very useful for configuration files for example. If you don't know Jinja, don't worry about it right now, just know that they are different things.

1. In the sidebar, expand the **Automation Execution** section.
2. Click the **Templates** link
3. Explore the `Configure SNMP` Job Template settings that was pre-created for you. As it's name indicates, this Job Template will allow us to configure SNMP in our devices.
4. Now go back to the **Templates** and explore the other Job Template: `Update banner`
5. Inside the details of the Job Template, if you click in the **Survey** tab you will see it has a couple of questions to make this Job Template "interactive" and input the details at execution time.

☑️ Task 5 - Workflows
===
A **Workflow Job Template** is a series of connected automation tasks (or Playbooks) that are executed in a specific order to achieve a desired outcome. Compared to an individual Playbook, a **Job Template** handles tasks in a single playbook, while a **Workflow Job Template** is designed to manage more complex automation scenarios involving multiple playbooks (or Job Templates) and decision-making processes (success or failure conditions for each Job Template). Workflows can "concatenate" multiple types of Job Templates:

- Job templates
- Workflow job templates
- Project syncs
- Inventory source syncs

Only **Workflow Job Templates** have the Workflow Visualizer icon (wf-viz-icon) as a shortcut for accessing the workflow editor.

> [!WARNING]
> Remember, do not confuse a **Job Template** with a **Jinja template**, or with a **Workflow Job Template**.  They are 3 separate things!

1. Once more, click the **Templates** link in the menu **Automation Execution** section
2. Look for the `Network Device Initial Setup Workflow`
3. Click on it to see the details of the Workflow.
4. If you want to check the graphical user interface, click on the **Workflow Visualizer** button on the top right.


✅ Next Challenge
===
Press the **Next** button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=netops-aap25&title=Issue+with+netops-aap25&assignees=leogallego)

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
