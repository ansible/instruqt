---
slug: windows
id: 3nljdmtjfpbx
type: challenge
title: Windows
tabs:
- title: Controller UI
  type: service
  hostname: control
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
  port: 80
difficulty: basic
timelimit: 1500
---
👋 Introduction
===
In this section we will look at solutions for Windows Automation

To get started, login to the Ansible Controller with the following credentials

username: `admin`

password: `ansible123!`

Find detailed documentation and playbooks from this lab [here](https://github.com/RedHatGov/product-demos

☑️ Task 1 - Setup Windows Demos
===

Navigate to the Templates section and locate the **SETUP** template.

Click the 🚀 to run the Job Template and select `windows` from the drop down.

While the Job runs, move to the next task.

☑️ Task 2 - (optional) Explore the Inventory
===
While the **SETUP** job is running, click on the Inventories section.

Select the **Workshop Inventory** and click **Hosts**

You will see that there are 2 hosts added to the inventory. `win1` is your windows host.

Click on **Groups** and you will see there are 2 groups in the inventory. `os_windows` contains your `win1` windows host.

When running Job Templates you will be prompted for the hosts to run against. Use `win1` to target a single host or `os_windows` to target a group of hosts.

Additional hosts or groups may become avaible if you setup additional hosts and Dynamic Inventory

By this point, the **SETUP** job should be complete. Click on **Jobs** to see your job history and verify.

You can click on the **SETUP** job to see the log of what changed or move to the next Task.

☑️ Task 3 - (optional) Run Jobs
===
Navigate back to the Templates Section and you will see a series of Job Templates that have been created for you.

Locate the **WINDOWS / Run Powershell** in the Templates section and click the 🚀. Enter `os_windows` into the survey and Launch.

This Job will run a given powershell command against the `os_windows` group of hosts.

If this job completes succsessfully, you know that your have access to your hosts and you are ready to run other jobs.



