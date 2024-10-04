---
slug: controller
id: 4if5qoqvyjev
type: challenge
title: Understanding and using Automation controller
teaser: Setup dynamic inventory in automation controller for AWS EC2
notes:
- type: text
  contents: |-
    Please click the Green Start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="right"> on the *bottom right corner* if it did not already start creating the lab environment. <br />

    To begin your lab briefing click the white `>` on the right->
- type: text
  contents: |
    # Automation controller

    The control plane for Ansible Automation Platform is the automation controller (replacing Ansible Tower).

    <center><img src="https://github.com/IPvSean/pictures_for_github/blob/master/automation_controller.png?raw=true" width=600px%></center>

    Automation controller helps standardize how automation is deployed, initiated, delegated, and audited, allowing enterprises to automate with confidence while reducing sprawl and variance.  Manage inventory, launch and schedule workflows, track changes, and integrate into reporting, all from a centralized user interface and RESTful API.
- type: text
  contents: |+
    # Inventories

    An Inventory is a collection of hosts against which jobs may be launched, the same as an Ansible inventory file. Inventories are divided into groups and these groups contain the actual hosts. Groups may be sourced manually, by entering host names into the automation controller, or from one of its supported cloud providers.

    # Inventory Plugins

    There is a variety of pre-built Inventory Plugins that are available:

    * Amazon Web Services EC2
    * Google Compute Engine
    * Microsoft Azure Resource Manager
    * VMware vCenter

- type: text
  contents: |-
    Example of configuring AWS inventory source:

    ![picture of AWS inventory](https://docs.ansible.com/automation-controller/latest/html/userguide/_images/inventories-create-source-AWS-example.png)
- type: text
  contents: |-
    # Lab Diagram

    Here is a diagram of the lab topology.
    <center>
    <img src="https://github.com/IPvSean/pictures_for_github/blob/master/aws-diagram.png?raw=true" width="600px"></center>

    There is one automation controller node, and two Red Hat Enterprise Linux nodes running in Amazon Web Services (AWS) Elastic Cloud (EC2).
- type: text
  contents: |-
    # Lets get started

    That is the end of of your lab briefing!

    Once the lab is setup you can click the Green start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="left"> in the bottom right corner of this window.
tabs:
- id: 90jzkougrut1
  title: Automation Controller
  type: service
  hostname: controller
  port: 443
- id: hx9j8lettyru
  title: AWS console
  type: service
  hostname: cloud-client
  path: /
  port: 80
difficulty: ""
timelimit: 300
---
👋 Introduction
===
#### Estimated time to complete: *5 minutes*<p>
Welcome to the Ansible Hybrid Cloud Automation - Infrastructure visibility lab. In the following challenges and tasks we will guide you in understanding Infrastructure visibility use case. In this first challenge, you will learn about setting up a dynamic inventory for AWS EC2 in automation controller.

Login to Automation controller with the following credentials

<table>
<tr>
<td>username:</td>
<td><code>admin</code></td>
</tr>
<tr>
<td>password:</td>
<td><code>ansible123!</code></td>
</tr>
</table>

☑️ Task 1 - Understanding credentials
===

Credentials are utilized for authentication when launching Jobs against machines, synchronizing with inventory sources, and importing project content from a version control system.  In this lab, we have two different credentials:

* **RHEL on AWS - SSH KEY** - This is an SSH key for the two Red Hat Enterprise Linux hosts running on AWS
* **aws_credential** - This is the AWS credential for performing actions on AWS cloud.  For example, creating a VPC, or shutting down an instance.

In the **Automation Controller** tab at the top of your window click on the **Credentials** link under **Resources** to examine the two pre-configured credentials.  Login with the credentials provided above.

**Note** The keys are encrypted so no one, not even an administrator, can see the key once it has been placed in automation controller.


☑️ Task 2 - Creating an Inventory
===

Click on the **Automation Controller** tab at the top of lab. Click on the **Inventories** link under the **Resources** group on the left navigation menu.  Now, click the blue **Add** button and select **Add Inventory**.

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/add_inventory.png?raw=true" style="width:200px;margin-left:0px" >

Fill out the following fields:

<table>
<tr><th>Parameter</th><th>Value</th>
</tr>
<tr><td>Name</td><td>AWS Inventory</td>
<tr><td>Organization</td><td>Default</td>
</table>

Click the blue **Save** button.

☑️ Task 3 - Creating an Inventory Source
===

Now that you have created the **AWS Inventory** click on the Sources tab at the top of the inventory.

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/sources-savage.png?raw=true" style="width:300px;margin-left:0px">

Now click the blue **Add** button.

Fill out the following fields:

<table>
<tr><th>Parameter</th><th>Value</th>
</tr>
<tr><td>Name</td><td>AWS Source</td>
<tr><td>Source</td><td>Amazon EC2</td>
</table>

Once you select **Amazon EC2** some more choices will pop up.  Fill out the following field:

<table>
<tr><th>Parameter</th><th>Value</th>
</tr>
<tr><td>Credential (click the magnifying glass)</td><td>aws_credential</td>
</table>

Select the radio button next to `aws_credential`, then click select.

Click **Save**

Now click **Sync** to retrieve the inventory from AWS EC2.

☑️ Task 4 - Examine the Inventory
===

For this task we will examine the inventory then run an ad-hoc job.  Click on the **AWS Inventory** link to return to the top-level menu for the AWS Inventory.

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/aws_inventory_menu.png?raw=true" style="width:400px;margin-left:0px">

Now click on **Hosts**.  There will be two hosts listed with their name pre-pended with **ec2**.  These were dynamically pulled from AWS via the Inventory Plugin we just setup.  Click the checkmark next to each host then click the **Run Command** button.  Fill out the following fields:

### **Details**:
<table>
<tr><th>Parameter</th><th>Value</th>
</tr>
<tr><td>Module</td><td>ping</td>
</table>

Click **Next**

<hr>

### **Execution Environment**:

Select
* **Default execution environment**

Click **Next**

<hr>

### **Credential**:

Select
* **RHEL on AWS - SSH KEY**

Click **Next**

<hr>

### **Preview**

Press the **Launch** button.

<hr>


The ad-hoc test will setup an Ansible <a href="https://docs.ansible.com/ansible/latest/collections/ansible/builtin/ping_module.html" target="_new">ping</a> task which will verify we have SSH connectivity between our control node and the two RHEL instances running on AWS.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?title=Issue+with+Ansible+Hybrid+Cloud+Automation+-+Infrastructure+visibility&assignees=ipvsean).

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
