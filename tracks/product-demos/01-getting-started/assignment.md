---
slug: getting-started
id: 01g6jcm1rcoc
type: challenge
title: Getting Started
notes:
- type: text
  contents: |-
    # Welcome to the Automate the Enterprise product demos!

    These demos show the power of the Ansible Automation platform for automating Linux, Windows, Networking, and Cloud all under one roof.

    Your lab will be ready soon. While you wait, click the arrow to the right to learn a little bit about the envrionment.
- type: text
  contents: |-
    # About the Lab

    <a href="#mesh_nodes">
      <img alt="Controller login" src="../assets/img/topology.png" />
    </a>

    This lab contains an Ansible Controller, Red Hat Satellite, RHEL8 client, and Windows Server client. These will be added to the Workshop Inventory for you and a credential is created so that you can manage these hosts.
- type: text
  contents: |-
    # How Authentication Works

    The "Workshop Credential" contains the `ansible_password` (for windows) and ssh private key (for linux) to connect to your nodes. The username is defined for each host in the inventory with the `ansible_user` variable.

    Windows uses NTLM for authentication and the winrm connection variables are defined using `group_vars` in the project repo. Windows nodes _MUST_ be in `os_windows` group to properly configure the connection.
- type: text
  contents: |-
    # This Lab is for You!

    Shortly you will enter the lab environment and you'll find some instructions on the right hand side. These are merely suggestions to get you started. You do not have to follow them explicitly. Choose your own adventure and experiment to show, tell, learn, test, break, and fix. This lab is for you!

    Don't forget to submit comments or issues through the **FEEDBACK** job template and check us out on [**GitHub**](https://github.com/RedHatGov/product-demos) to be part of the community.

    Your lab is waiting...Happy Automating!
tabs:
- title: Controller UI
  type: service
  hostname: control
  port: 443
- title: Satellite UI
  type: service
  hostname: satellite
  port: 443
- title: VS Code
  type: service
  hostname: control
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel%2Fansible-files
  port: 443
- title: node1 web
  type: service
  hostname: node1
  port: 80
- title: win1 web
  type: service
  hostname: win1
  path: /
  port: 80
- title: AWS Account
  type: service
  hostname: cloud-client
  path: /
  port: 80
difficulty: basic
timelimit: 1500
---
👋 Introduction
===
Before we get started a few things to know...
1) You do not have to follow this guide. Choose your own adventure!
2) Some things may have dependencies in other systems. Check the end of your **SETUP** job logs for prereqs.
3) Please submit issues through the **FEEDBACK** job or [GitHub Issues](https://github.com/ansible/product-demos/)
	4) If you would like to customize these demos, fork the [repo](https://github.com/ansible/product-demos/) and update the `Ansible official demo project` project URL or branch before you continue.

To get started, log in to the Ansible Controller with the following credentials:

username: `admin`

password: `ansible123!`

Find detailed documentation and playbooks from this lab [here](https://github.com/ansible/product-demos)

☑️ Task 1 - Setup Demos
===

Navigate to the Templates section and locate the **SETUP** template.

Click the 🚀 to run the Job Template and select a demo category from the drop-down. This will create job templates, credentials, and inventories for you.

While the Job runs, move to the next task.

☑️ Task 2 - (optional) Explore the Inventory
===
While the **SETUP** job runs, click on the Inventories section.

Select the **Workshop Inventory** and click **Hosts**

You will see that there are 2 hosts added to the inventory. `node1` is your Linux host and `win1` is your Windows host. The variables `ansible_user` and `ansible_host` are defined for each host for connectivity and authentication.

Click on **Groups** and you will see two groups in the inventory. `os_linux` contains your `node1` linux host, `os_windows` contians your `win1` windows host. Group vars are used by the `os_windows` group for winrm configuration.

When running Job Templates you will be prompted for the hosts to run against. Use `node1` or `win1` to target a single host or `os_linux` or `os_windows` to target a group of hosts.

Additional hosts or groups may become available if you use Dynamic Inventories.

By this point, the **SETUP** job should be complete. Click on **Jobs** to see your job history and verify.

You can click on the **SETUP** job to see the log of what changed or move to the next Task.

☑️ Task 3 - (optional) Run Jobs
===
Navigate back to the Templates Section and you will see a series of Job Templates that have been created for you.

Locate the **LINUX / Fact Scan** job and click the 🚀. Enter `os_linux` into the limit field and Launch. This will verify connectivity.

For Windows, locate the **WINDOWS / Run PowerShell** job and click the 🚀. Enter `os_windows` into the limit field and Launch. This will verify connectivity.


☑️ Task 4 - Accessing the Command Line
===

To access the command line of your systems, click on the **VS Code** tab at the top. Select `Terminal` > `New Terminal`.

To SSH to `node1` you must type `sudo su` into the terminal to change to the root user. You may now run `ssh node1` if you need to access the command line of node1.

The public and private key used by your controller are located in the `/root/.ssh/` directory.

You will need the `/root/.ssh/id_rsa.pub` key if you want to build additional systems for your lab.

☑️ Task 5 - Expanding your lab
===

Need more systems? Need a different operating system? No problem.

Run the `SETUP` job and select `cloud` from the dropdown in the survey.

When this job completes:
1) Update the `AWS` credential with your access and secret key
2) Run the `Cloud / AWS / Create Keypair` job template. Choose a region, and paste the public key (`/root/.ssh/id_rsa.pub`) into the survey.
3) Run the `Cloud / AWS / Create VPC` job template. Choose the same region you picked for the keypair.
4) Use the `Cloud / AWS / Create VM` to create additional VMs in your VPC.
5) Refresh the dynamic inventory to add your new instances to you inventory.



