---
slug: inventory
id: w69by5ntbgo0
type: challenge
title: Create an Inventory
teaser: Let's take inventory
notes:
- type: text
  contents: "# Inventories\n<br>\n<p align=\"center\">\n  <img width=\"700px\" src=\"https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inventory.png\">\n</p>\n<br>\n\nAn
    [**Inventory**](https://docs.ansible.com/automation-controller/latest/html/userguide/inventories.html)
    is a collection of hosts against which jobs may be launched, the same as an Ansible
    inventory file.\n\n<style type=\"text/css\" rel=\"stylesheet\">\nh1 {\n\ttext-align:
    center\n\t}\n</style>\n"
- type: text
  contents: "# Inventories\n<br>\n<p align=\"center\">\n  <img width=\"700px\" src=\"https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-hosts.png\">\n</p>\n<br>\n\n[**Inventories**](https://docs.ansible.com/automation-controller/latest/html/userguide/inventories.html#inventory-plugins)
    are divided into groups and these groups contain the actual hosts. Groups may
    be sourced manually, by entering host names into controller, or from a supported
    cloud provider.\n\n<style type=\"text/css\" rel=\"stylesheet\">\nh1 {\n\ttext-align:
    center\n\t}\n</style>"
tabs:
- title: Controller Dashboard
  type: service
  hostname: controller
  port: 443
- title: Controller CLI
  type: terminal
  hostname: controller
- title: Host 01 CLI
  type: terminal
  hostname: host01
- title: Host 02 CLI
  type: terminal
  hostname: host02
- title: Editor
  type: service
  hostname: controller
  path: /editor/
  port: 443
difficulty: basic
timelimit: 600
---
## Create the following in the controller dashboard:

*Login credentials:*<p>
User: admin <p>
Password: ansible123!

> **Note:**<p>
>
> All the fields are **case-sensitive** and the check will fail! Please maske sure you use the same capitalization as used in the assignments.

Besides the automation controller instance, your sandbox environment also contains two virtual machines: `host01` and `host02`.

We've also added extra terminal tabs to these machines, so you can have a look around.

These machines are configured to be able to `ssh` to each other using an ssh key.

## Your assignment

All tasks are performed in the automation controller dashboard
* On the side navigation under the **Resources** section, click on **Inventories**
* Under **Inventories**, click on **Add**
* Click **Add inventory**.
* Create a new Inventory with the name `Lab-Inventory`. Leave all the other fields as-is, and click **Save**.
![inventory](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inventory.png)
***
<br>

Once you've created the `Lab-Inventory`, click on **Hosts*

* Click on "Add".
* Enter the name `host01` in the **Name** text box. Leave everything else the same, then click **Save**.
* Repeat the above steps to create `host02`.

![hosts](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-hosts.png)

***
<br>

* Once you've added `host01` and `host02` to the `Lab-Inventory` go back to the Inventory list.
* Click on `Lab-Inventory` and select **Groups** on the top menu.
* Click **Add** to create a new group.
* Create a new group called `web` in the `Lab-Inventory`.
* Click **Save** when you are finished.
![group](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inst-add-group.png)
***
<br>

* Click on the newly created `web` group and click on **Hosts** on the top menu.
* Click **Add existing host**. A pop up will appear.
* Select both `host01` and `host02`, then click **Save**.
* `host01` and `host02` are now added to the `web` group.
![group](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inst-add-hosts-group.png)
***
<br>

**When you are done, press the "Check" button below to go to the next challenge.**
