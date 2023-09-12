---
slug: network
id: iqyvvvdx2fsu
type: challenge
title: Network
tabs:
- title: Controller UI
  type: service
  hostname: control
  port: 443
difficulty: basic
timelimit: 1500
---
👋 Introduction
===
In this section we will look at solutions for Network Automation

To get started, login to the Ansible Controller with the following credentials

username: `admin`

password: `ansible123!`

Find detailed documentation and playbooks from this lab [here](https://github.com/RedHatGov/product-demos)

**Note**: _These demos rely on virtual devices hosted by [Cisco DevNet](https://developer.cisco.com/docs/sandbox/#!getting-started/what-is-devnet-sandbox). Jobs may fail due to high utilization or maintenance._

☑️ Task 1 - Setup Network Demos
===

Navigate to the Templates section and locate the **SETUP** template.

Click the 🚀 to run the Job Template and select `network` from the drop down.

While the Job runs, move to the next task.

☑️ Task 2 - Explore the Inventory
===
While the **SETUP** job is running, click on the Inventories section.

Select the **Network Inventory** and click **Hosts**

You will see that there are 3 hosts added to the inventory.

Click on **Groups** and you will see there are 3 groups in the inventory, `ios`, `iosxr`, `nxos`.

When running Job Templates you will be prompted for the hosts to run against. Use one of the group names to taget a specific device type.

Additional hosts or groups may become avaible if you setup additional hosts and Dynamic Inventory

By this point, the **SETUP** job should be complete. Click on **Jobs** to see your job history and verify.

You can click on the **SETUP** job to see the log of what changed or move to the next Task.

☑️ Task 3 - Run Jobs
===
Navigate back to the Templates Section and you will see a series of Job Templates that have been created for you.

Locate the **NETWORK / Configuration** job and click the 🚀. Enter `all` into the limit field, click next.

Choose the network config you would like to deploy (eg. acls), click Next, then Launch.




