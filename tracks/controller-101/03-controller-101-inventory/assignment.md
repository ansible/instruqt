---
slug: controller-101-inventory
id: odf6zdnxims7
type: challenge
title: 1.1 - Creating an Inventory
teaser: Managing hosts and groups the easy way
notes:
- type: text
  contents: |-
    # Inventories

    ![inventories-home-with-examples.png](../assets/inventories-home-with-examples.png)

    An Inventory is a collection of hosts against which jobs may be launched, the same as an Ansible inventory file.
- type: text
  contents: |-
    # Inventories, create new inventory

    ![inventories-create-new-inventory.png](../assets/inventories-create-new-inventory.png)

    In this challenge, we will be creating a new inventory, adding hosts and creating a host group inside the inventory.
tabs:
- title: Automation controller
  type: service
  hostname: control
  path: /
  port: 443
difficulty: ""
timelimit: 600
---
🗃️ 1.1 - Inventories
===

An inventory is a collection of hosts against which jobs (ex. playbooks) may be launched, the same as an Ansible inventory file, it indicates which nodes will be managed by the control machine, in this case the automation controller.

[Inventories](https://docs.ansible.com/automation-controller/latest/html/userguide/inventories.html) may be divided into *groups* and these groups contain the actual *hosts*. The *hosts* may be sourced manually or dynamically and can be referenced by their **IP addresses** or their **hostnames**.

In automation controller you will be able to run multiple playbooks against these inventories without recreating them.


☑️ Task 1 - Creation of the Inventory
===

1. On the side navigation bar, under the **Resources** section, click on **Inventories**
2. Click on the blue **Add** button
3. Select **Add inventory** from the dropdown
4. Name it `Lab-Inventory` . Leave all the other fields as they are.
6. Click **Save**

☑️ Task 2 - Add Hosts to the Lab-Inventory
===

> [!NOTE]
> If you are not in the  **Lab-Inventory**, click on it again to edit it.

1. On the tab bar, click on **Hosts**
2. Click on the blue **Add** button.
3. In the **Name** text box enter `node1` . Leave all the other fields as they are.
5. Click **Save**
6. Click on the **Hosts** menu in the sidebar or use the breadcrumb **Back to hosts**
7. Repeat the above steps to create a new host, named `node2`.


☑️ Task 3 - Create the [web] group in Lab-Inventory
===

1. On the sidebar, go to **Inventories** and click on  the `Lab-Inventory`
2. On the tab bar of `Lab-Inventory`, click on **Groups**
3. Click on the **Add** button to create a new group.
4. Create a new group named `web` (NOTE: you don't need to input the `[ ]` like you would in an inventory file).
5. Click **Save** when you are finished.


☑️ Task 4 - Add node1 and node2 to the [web] group in Lab-Inventory
===

1. Click on the **Hosts** tab on the top menu of the `web` group
2. Click **Add existing host**. A pop up will appear.
3. Select both `node1` and `node2` then click **Save**.
4. Verify `node1` and `node2` are now added to the `web` group.


✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=intro-to-controller&title=Issue+with+Intro+to+Controller+slug+ID:+controller-101-inventory&assignees=leogallego).

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
