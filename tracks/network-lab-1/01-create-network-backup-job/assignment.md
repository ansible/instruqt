---
slug: create-network-backup-job
id: hy7xyooj7xca
type: challenge
title: Create a backup automation job template
teaser: Lab 1, challenge 1, learn how to create a backup job template in automation
  controller
notes:
- type: text
  contents: |
    # Lab 1 - Config Backup and Restore

    This lab will walk you through using Automation controller to automate backup and restore the configuration of a Cisco CSR (cloud services router) running IOS-XE.

    Please click the Green Start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="left"> on the bottom right corner if it did not already start provisioning.
- type: text
  contents: |-
    # Lab Diagram

    The lab diagram for this demonstration is very simple.  There will be one Red Hat Enterprise Linux 8 device running automation controller.  It is directly connected to the management network for a Cisco CSR (cloud services router) running IOS-XE.

    <center><img src="https://github.com/IPvSean/pictures_for_github/blob/master/lab1-topo.png?raw=true" width="400"></center>
- type: text
  contents: |-
    # Quick Automation Victories

    We know that network backup and restores are fairly uninteresting in the grand scheme of things, but they are a very common and ubiquitous use-case that all network operators will need. This provides an easy turn key use-case for network engineers to start their automation journey.
- type: text
  contents: |-
    # Automation controller

    Automation controller provides a standardized way to define, operate, and delegate Ansible automation across the enterprise. It includes a Web User Interface (WebUI) that we will be using for this challenge.
- type: text
  contents: |-
    # Job Templates

    Everything in Automation controller revolves around the concept of a **Job Template**.  Job Templates allow Ansible Playbooks to be controlled, delegated and scaled for an organization.

    Job templates also encourage the reuse of Ansible Playbook content and collaboration between teams.

    A Job Template requires:
    - An **Inventory** to run the job against
    - A **Credential** to login to devices.
    - A **Project** which contains Ansible Playbooks
- type: text
  contents: |-
    # Challenge 1 - Creating a backup Job Template

    For this challenge exercise you are going to create a Job Template in Automation controller.  We are going to use the Network Toolkit Collection (https://github.com/network-automation/toolkit) that contains multi-vendor playbooks for Backup, restore and more.

    The **credentials** (username and password), **inventory** (a single Cisco router) and **project** (the network toolkit repository listed above) are already added.  We simply need to tie them together into a simple re-usable Job Template for our organization to use.
- type: text
  contents: |-
    # Lets get started

    That is the end of of your lab briefing!

    Once the lab is setup you can click the Green start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="left"> in the bottom right corner of this window.
tabs:
- title: Automation controller WebUI
  type: service
  hostname: controller
  port: 443
- title: Automation controller Terminal
  type: terminal
  hostname: controller
difficulty: basic
timelimit: 300
---
For this exercise we are going to create an automation job on Automation controller

# Step 1 - Login to automation controller
To login to automation controller select the `Automation controller WebUI` tab at the top of your screen.

Login with the following credentials:

username: `admin`<br>
password: `ansible123!`

# Step 2 - Create an automation job

- Navigate to **Job Templates** by clicking on **Templates** found under Resources on the left navigation menu. <img src="https://github.com/IPvSean/pictures_for_github/blob/master/job_templates.png?raw=true" width="150px">
- You will see a list of **Job Templates**.  Job templates encourage the reuse of Ansible playbook content and collaboration between teams.
- Click the blue Add button and select **Add job template**
- Assign the following values

<table>
  <tr>
    <th>Name</th>
    <th>Value</th>
  </tr>
  <tr>
    <td>Name</td>
    <td><code>Network Automation - Backup</code></td>
  </tr>
  <tr>
    <td>Job Type</td>
    <td><code>Run</code></td>
  </tr>
  <tr>
    <td>Inventory</td>
    <td><code>Network Inventory</code></td>
  </tr>
  <tr>
    <td>Project</td>
    <td><code>Network Toolkit</code></td>
  </tr>
  <tr>
    <td>Execution Environment</td>
    <td><code>Default execution environment</code></td>
  </tr>
  <tr>
    <td>Playbook</td>
    <td><code>playbooks/network_backup.yml</code></td>
  </tr>
  <tr>
    <td>Credentials<br><b>NOTE:</b> there are two credentials</td>
    <td><ul><li><code>Network Credential</code><li><code>AAP controller credential</code></li></ul></td>
  </tr>
</table>

To find the `AAP controller credential` change the **Selected Category** to `Red Hat Ansible Automation Platform`

- Click the blue **Save** button to save your job template.

# Step 3 - Verify

Click the Green `Check` button below to verify the job template was created.


