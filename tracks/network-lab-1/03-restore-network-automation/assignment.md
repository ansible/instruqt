---
slug: restore-network-automation
id: 6bm7wqtewfrt
type: challenge
title: Run a network restore automation job
teaser: Lab 1, challenge 3, running a network restore job
notes:
- type: text
  contents: |+
    # Challenge 3 - Running the restore automation job

    This challenge will walk you through using Automation controller to execute the restore job you created on the 1st challenge.

    Please click the Green Start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="left"> on the bottom right corner if it did not already start provisioning.

- type: text
  contents: |-
    # How it works

    1. Network operator will execute the `Network Automation - Backup` job like we did in the last challenge
    2. The automation job will retrieve the configuration from the Cisco IOS router.
    3. The automation job will then store it on a specified `backup-server`
    4. Finally, The automation job will automatically create the `Network Automation - Restore` Job Template and populate all available backups for a Network Operator to choose via a Survey

    We can actually automate Automation controller with simple tasks using the `ansible.controller` Ansible Collection.
- type: text
  contents: |-
    # How it works: Animation


    <center>
    <img src="https://github.com/IPvSean/pictures_for_github/blob/master/network-backup.gif?raw=true"></center>
- type: text
  contents: |-
    # Surveys

    Surveys set extra variables for the playbook similar to ‘Prompt for Extra Variables’ does, but in a user-friendly question and answer way. Surveys also allow for validation of user input.
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
For this exercise we are going to run the network restore automation job

# Step 1 - Login to automation controller
To login to automation controller select the `Automation controller WebUI` tab at the top of your screen.

Login with the following credentials:

username: `admin`<br>
password: `ansible123!`

# Step 2 - Execute Network Automation - Restore Job Template

- Navigate to **Job Templates** by clicking on **Templates** found under Resources on the left navigation menu. <img src="https://github.com/IPvSean/pictures_for_github/blob/master/job_templates.png?raw=true" width="150px">
- To execute the **Network Automation - Backup Job Template** click the rocket button which incidates the launch job button:

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/launch_job.png?raw=true">

# Step 3 - Verify

Click the Green `Check` button below to verify the job executed.


