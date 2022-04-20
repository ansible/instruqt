---
slug: backupjob
id: i1o2ap0i8b2l
type: challenge
title: Run a network backup automation job
teaser: Lab 1, challenge 2, learning to run a job in automation controller
notes:
- type: text
  contents: |+
    # Challenge 2 - Running the backup automation job

    This challenge will walk you through using Automation controller to execute the backup job you created on the 1st challenge.

    Please click the Green Start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="left"> on the bottom right corner if it did not already start provisioning.

- type: text
  contents: |+
    # Ansible Collections

    Ansible provides automation content in the form of collections.  An Ansible Collection contains modules, plugins and roles that a network engineer can use to build and customize their automation.

    If you need a quick primer on what an Ansible Collection is, please refer to this [YouTube Video here](https://www.youtube.com/watch?v=WOcqhk7TdYc&t=69s).

    <center><iframe width="560" height="315" src="https://www.youtube.com/embed/WOcqhk7TdYc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

- type: text
  contents: |
    # The Cisco IOS collection

    For this demonstration we are going to automate against a Cisco IOS-XE router.  We need to use the Cisco IOS collection.

    The FQCN (or fully qualified collection name) to use a module is:

    `namespace.collection.module`

    So for our example it is

    `cisco.ios.<module name>`

    The task is this simple:

    ```
    - name: backup cisco ios configuration
      cisco.ios.config:
        backup: true
      register: config_output
     ```
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
- title: Visual Studio Code
  type: service
  hostname: controller
  path: /editor/
  port: 443
difficulty: basic
timelimit: 600
---
For this exercise we are going to run the automation job on Automation controller

# Step 1 - Login to automation controller
To login to automation controller select the `Automation controller WebUI` tab at the top of your screen.

Login with the following credentials:

username: `admin`<br>
password: `ansible123!`

# Step 2 - Execute Network Automation - Backup Job Template

- Navigate to **Job Templates** by clicking on **Templates** found under Resources on the left navigation menu. <img src="https://github.com/IPvSean/pictures_for_github/blob/master/job_templates.png?raw=true" width="150px">
- To execute the **Network Automation - Backup Job Template** click the rocket button which incidates the launch job button:

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/launch_job.png?raw=true">

# Step 3 - Optional - Verify Backup

In the Visual Studio Code tab you can open the backup configuration.  Open the `/backup` directory with Visual Studio Code and navigate to the most recent timestamp.  If you have executed the job more than one time you will have multiple options.  Open the `cisco.txt` file to reveal the Cisco IOS-XE running configuration.

# Step 4 - Verify

Click the Green `Check` button below to verify the job executed.


