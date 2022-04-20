---
slug: networkreportjob
id: i1o2ap0i8b2l
type: challenge
title: Run a network report automation job
teaser: Lab 1, challenge 2, learning to run a job in automation controller
notes:
- type: text
  contents: |
    # Challenge 2 - Running the Network Automation - Report job

    This challenge will walk you through using Automation controller to execute the `Network Automation - Report` you created on the 1st challenge.
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
    - name: retrieve cisco facts
      cisco.ios.facts:
        gather_subset: config
        gather_network_resources: ospf
     ```
- type: text
  contents: |-
    # Network automation begins and ends with facts

    Each network resource modules can retrieve facts about that particular resource.  For example if you want to retrieve VLAN information you can return a YAML or JSON data structure from Arista, Cisco or Juniper network devices.

    <img src="https://github.com/IPvSean/pictures_for_github/blob/master/retrieve_facts.png?raw=true">
- type: text
  contents: |-
    # Data output is flexible

    Ansible Automation Platform can create customized network reports with facts.

    <img src="https://github.com/IPvSean/pictures_for_github/blob/master/create_report.png?raw=true">
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
- title: Dynamic Report
  type: service
  hostname: controller
  port: 8088
difficulty: basic
timelimit: 600
---
For this exercise we are going to run the automation job on Automation controller

# Step 1 - Login to automation controller
To login to automation controller select the `Automation controller WebUI` tab at the top of your screen.

Login with the following credentials:

username: `admin`<br>
password: `ansible123!`

# Step 2 - Execute Network Automation - Network Report Job Template

- Navigate to **Job Templates** by clicking on **Templates** found under Resources on the left navigation menu. <img src="https://github.com/IPvSean/pictures_for_github/blob/master/job_templates.png?raw=true" width="150px">
- To execute the **Network Automation - Report** Job Template click the rocket button which incidates the launch job button: <img src="https://github.com/IPvSean/pictures_for_github/blob/master/launch_job.png?raw=true">



# Step 3 - Open Network Report

After the Job run and completes successfully, click the **Dynamic Report** tab at the top.  Make sure to refresh the tab if you don't see any results.

To refresh click the <img src="https://github.com/IPvSean/pictures_for_github/blob/master/refresh.png?raw=true"> button

# Step 4 - Click around the Dynamic Report

This is a virtual Cisco IOS router so it only has a single physical interface on it.  Click around the network resources to expand the resource boxes and show more information.

This report is created using very simple Jinja2 templates in conjunction with the jQuery UI Accordion tool.

# Step 5 - Optional

Go to the **Automation controller Terminal** tab and login to the cisco device.

```
sudo -i
ssh cisco
```

Configure something (your choice) and re-run the report.

For example:

```
cisco-ios-csr-1731#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
```

```bash
router ospf 1
  router-id 1.2.3.4
```

# Step 6 - Verify

Click the Green `Check` button below to verify the job executed.


