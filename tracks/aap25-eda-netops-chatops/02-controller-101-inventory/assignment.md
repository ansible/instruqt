---
slug: controller-101-inventory
id: 0xaylavh8efj
type: challenge
title: 2. Automation Controller - Creating an Inventory
teaser: Managing hosts and groups the easy way!
notes:
- type: text
  contents: |-
    # Inventories

    ![Oct-16-2024_at_02.39.15-image.png](../assets/Oct-16-2024_at_02.39.15-image.png)

    An inventory defines the hosts and groups of hosts upon which commands, modules, and tasks in a playbook operate.
- type: text
  contents: |-
    # Inventories, create new inventory

    ![Oct-16-2024_at_02.39.47-image.png](../assets/Oct-16-2024_at_02.39.47-image.png)

    In this challenge, we will be creating a new inventory, adding hosts and creating a host group inside the inventory.
tabs:
- id: mxrfqtg6nxky
  title: AAP
  type: service
  hostname: control
  port: 443
- id: ooyft7rib9y6
  title: gitea
  type: service
  hostname: gitea
  path: /
  port: 3000
difficulty: ""
timelimit: 0
enhanced_loading: null
---
🗃️ Inventories
===

An **inventory** in Ansible Auomation Platform is a collection of hosts against which jobs (ex. playbooks) may be launched, the same as an Ansible inventory file when using the command line. It indicates which nodes will be managed by the control machine, in this case the Automation Execution controller.

**Inventories** may be divided into *groups* and these groups contain the actual *hosts*. The *hosts* may be sourced manually or dynamically and can be referenced by their **IP addresses** or their **hostnames**.

With **Automation Execution (Automation controller)** you will be able to run multiple playbooks against these inventories without recreating them.

☑️ Task 1 - Creation of the Inventory
===

Go to the [button label="AAP"](tab-0) tab.

1. On the left side-bar, click the **Automation Execution** menu option.
2. Now click the **Infrastructure** section to expand it and click on **Inventories**
3. Click on the blue **Create inventory** button
4. Select **Create inventory** from the dropdown.
   ![create inventory button](../assets/create_inventory_button.png)
5. Name it `NetOps Inventory`.
6. In the **Organization** dropdown, select `Default`
7. Leave all the other fields as they are.
  ![Feb-03-2025_at_14.56.18-image.png](../assets/Feb-03-2025_at_14.56.18-image.png)
8. Click the blue **Create inventory** at the bottom of the screen.

☑️ Task 2 - Add hosts to the NetOps Inventory
===

> [!NOTE]
> If you are not in the  `NetOps Inventory`, click on it again to edit it.

1. Inside the `NetOps Inventory` you will see a tab bar.

2. On the tab bar, click on **Hosts**.
3. Click on the blue **Create host** button in the center.
  ![Feb-03-2025_at_14.58.12-image.png](../assets/Feb-03-2025_at_14.58.12-image.png)
5. We are going to add a few Arista cEOS devices first:
6. In the **Name** text box, enter `ceos1`.
7. Under **Variables**, enter `ansible_port: 2001`.
  ![Jan-21-2025_at_11.39.09-image.png](../assets/Jan-21-2025_at_11.39.09-image.png)
5. Click **Create host**
6. Use the breadcrumb **"< Back to Hosts"** on the tab bar, or click **Hosts** on the sidebar.
7. Repeat the above steps to create a new host, named `ceos2` with a variable `ansible_port: 2002` in `NetOps Inventory`.
8. Repeat the above steps to create a new host, named `ceos3` with a variable `ansible_port: 2003` in `NetOps Inventory`.
9. Now we are going to add a **Cisco Catalyst 8000V** device. Pay attention to the variable field below, it's different!
10. Repeat the above steps to create a new host, named `cat8000v` with a variable `ansible_host: cisco` in `NetOps Inventory`.

☑️ Task 4 - Create the [arista] and [cisco] groups in NetOps Inventory
===

1. On the sidebar, go to **Inventories** and click on  the `NetOps Inventory` (or use the breadcrumb to return to it).
2. On the tab bar of `NetOps Inventory`, click on the **Groups** tab
  ![Feb-03-2025_at_15.02.51-image.png](../assets/Feb-03-2025_at_15.02.51-image.png)
3. Click on the **Create group** button to create a new group.

### Creating the `arista` group
4. Name the group `arista`
> [!NOTE]
> You don't need to input the brakets (`[...]`) like you would in an inventory file
5. Populate the **Variables** field with the following variables. These will be applied to all the `ceos` hosts in this group.

```yaml
ansible_connection: ansible.netcommon.network_cli
ansible_network_os: arista.eos.eos
ansible_user: ansible
ansible_password: ansible
ansible_become: true
ansible_become_method: enable
ansible_host: podman-host
```
  ![Feb-03-2025_at_15.05.23-image.png](../assets/Feb-03-2025_at_15.05.23-image.png)


6. Click the blue **Create group** button at the bottom.
7. Use the breadcrumb **"< Back to Groups"** on the tab bar.

### Creating the `cisco` group

8. Click on the **Create group** button again to create another group.
9. Name this group `cisco` and populate the **Variables** field with the following variables.

  ```yaml
  ansible_connection: ansible.netcommon.network_cli
  ansible_network_os: cisco.ios.ios
  ansible_user: admin
  ```

10. Click the blue **Create group** button at the bottom.

☑️ Task 5 - Add ceos1, ceos2 and ceos3 to the [arista] group in NetOps Inventory
===

1. Use the breadcrumb **"< Back to Groups"** on the tab bar.
2. Click on the `arista`  group you created,
3. Click on the **Hosts** tab on the top menu.
4. Click **Add existing host**. A pop up will appear.
5. Tick `ceos1`, `ceos2` and `ceos3` then click **Add hosts**.
   ![Jan-21-2025_at_11.43.12-image.png](../assets/Jan-21-2025_at_11.43.12-image.png)
6. Verify `ceos1`, `ceos2` and `ceos3` are now added to the `arista` group in the **Hosts** tab

☑️ Task 6 - Add cat8000v to the [cisco] group in netops-inventory
===

1. Use the breadcrumb **"< Back to Groups"** on the tab bar.
2. Click on the `cisco`  group you created, and then click on the **Hosts** tab on the top menu.
3. Click **Add existing host**. A pop up will appear.
4. Tick `cat8000v` then click **Add hosts**.
   ![Jan-21-2025_at_11.43.59-image.png](../assets/Jan-21-2025_at_11.43.59-image.png)
5. Verify `cat8000v` are now added to the `cisco` group in the **Hosts** tab.

✅ Next Challenge
===
Press the **Next** button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=netops-aap25&title=Issue+with+netops-aap25&assignees=leogallego)

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
