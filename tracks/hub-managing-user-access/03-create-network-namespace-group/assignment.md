---
slug: create-network-namespace-group
id: rk3hstxlzehy
type: challenge
title: Create the network namespace and group in private automation hub
teaser: Create a network user group and a user called Bob, which will have access
  to upload to upload ansible content collections to the network namespace in private
  automation hub.
tabs:
- title: automationhub-web
  type: service
  hostname: privatehub-01
  path: /
  port: 443
- title: automationhub-terminal
  type: terminal
  hostname: privatehub-01
difficulty: basic
timelimit: 400
---

🔐 Login credentials

>User: curator<p>
>Password: learn_ansible

This challenge is very similar to the last challenge, but in this one we will create a different group, user and namespace, below are the details:
1. Group Name - **Network Automation**
2. User name - **bob**
3. Namespace - **network**

☑️ Task 1 - Create a network user group
===

The Curator wants to create a user group called *Network Automation* for the network automation team. He needs to make sure that cloud user group has the permission to upload collections to the **network** namespace only.

Please go through the below steps to create a **Network Automation** user group.

1. Ensure you are already logged in as as the *curator* user in automationhub-web tab.
2. Click on "User Access" > Groups in the left pane after login.
3. Click on "Create" button.
<!-- ![Group Create Network Button](../assets/create_button_group_network.png) -->
<a href="#group_create_network_button">
  <img alt="Group Create Network Button" src="../assets/create_button_group_network.png" />
</a>
<a href="#" class="lightbox" id="group_create_network_button">
  <img alt="Group Create Network Button" src="../assets/create_button_group_network.png" />
</a>
4. Type "Network Automation" in the name of the group  and then click on Create button.
<!-- ![Group Create Network](../assets/create_dialog_group_network.png) -->
<a href="#group_create_network">
  <img alt="Group Create Network" src="../assets/create_dialog_group_network.png" />
</a>
<a href="#" class="lightbox" id="group_create_network">
  <img alt="Group Create Network" src="../assets/create_dialog_group_network.png" />
</a>
5. After you create the group, you will see a permissions page where you can assign permissions. Click "Edit". Edit permissions to add the "Upload to namespace" permission to the group here. Click on Save.
<!-- ![Group Create Network](../assets/network_group_permissions.png) -->
<a href="#network_group_permissions">
  <img alt="Network group permissions" src="../assets/network_group_permissions.png" />
</a>
<a href="#" class="lightbox" id="network_group_permissions">
  <img alt="Network group permissions" src="../assets/network_group_permissions.png" />
</a>


☑️ Task 2 - Create a user bob in network group
===
1. On the left pane click on "User Access" > "Users"
<!-- ![Create User Bob](../assets/create_user_bob_button.png) -->
<a href="#create_user_bob_button">
  <img alt="Create User Bob Button" src="../assets/create_user_bob_button.png" />
</a>
<a href="#" class="lightbox" id="create_user_bob_button">
  <img alt="Create User Bob Button" src="../assets/create_user_bob_button.png" />
</a>
2. Set the username field as "bob" and password field as "learn_ansible", assign the group as the "Network Automation" group to the user bob.
<!-- ![Create User Bob Dialog](../assets/create_user_bob_dialog.png) -->
<a href="#create_user_bob_dialog">
  <img alt="Create User Bob Dialog" src="../assets/create_user_bob_dialog.png" />
</a>
<a href="#" class="lightbox" id="create_user_bob_dialog">
  <img alt="Create User Bob Dialog" src="../assets/create_user_bob_dialog.png" />
</a>

☑️ Task 3 - Create a network namespace
===
1. On the left-pane click on "Collections" > "Namespaces" to go in the namespace menu.
<!-- ![Namespace Menu](../assets/namespace_menu.png) -->
<a href="#namespace_menu">
  <img alt="Namespace Menu" src="../assets/namespace_menu.png" />
</a>
<a href="#" class="lightbox" id="namespace_menu">
  <img alt="Namespace Menu" src="../assets/namespace_menu.png" />
</a>
2. Click on "Create" button to create a new namespace
<!-- ![Namespace Create Button2](../assets/namespace_create_button2.png) -->
<a href="#namespace_create_button2">
  <img alt="Namespace Create Button2" src="../assets/namespace_create_button2.png" />
</a>
<a href="#" class="lightbox" id="namespace_create_button2">
  <img alt="Namespace Create Button2" src="../assets/namespace_create_button2.png" />
</a>
3. In the Dialog, set the namespace name as "network" and set the owners of the namespace to the "Network Automation" group.
<!-- ![Namespace Create Network Dialog 1](../assets/namespace_create_network_dialog1.png) -->
<a href="#namespace_create_network_dialog1">
  <img alt="Namespace Create Network Dialog 1" src="../assets/namespace_create_network_dialog1.png" />
</a>
<a href="#" class="lightbox" id="namespace_create_network_dialog1">
  <img alt="Namespace Create Network Dialog 1" src="../assets/namespace_create_network_dialog1.png" />
</a>
4. Change the default permissions by removing "Change Namespace" permission and only keeping the "Upload to Namespace" permission for Network Automation group and the click on Create button.
<!-- ![Namespace Create Network Dialog 2](../assets/namespace_create_network_dialog2.png) -->
<a href="#namespace_create_network_dialog2">
  <img alt="Namespace Create Network Dialog 2" src="../assets/namespace_create_network_dialog2.png" />
</a>
<a href="#" class="lightbox" id="namespace_create_network_dialog2">
  <img alt="Namespace Create Network Dialog 2" src="../assets/namespace_create_network_dialog2.png" />
</a>
5. Logout from the curator user.
<!-- ![Curator Logout](../assets/curator_logout.png) -->
<a href="#curator_logout">
  <img alt="Curator Logout" src="../assets/curator_logout.png" />
</a>
<a href="#" class="lightbox" id="curator_logout">
  <img alt="Curator logout" src="../assets/curator_logout.png" />
</a>

☑️ Task 4 - Login as network group user bob
===
Login as user "bob" from Network Automation group in private automation hub instance.
🔐 Login credentials

>User: bob<p>
>Password: learn_ansible
<!-- ![Bob Login](../assets/bob_login.png
) -->
<a href="#bob_login">
  <img alt="Bob Login" src="../assets/bob_login.png" />
</a>
<a href="#" class="lightbox" id="bob_login">
  <img alt="Bob Login" src="../assets/bob_login.png" />
</a>

* Notice that the user "bob" doesn't have access to "User Access" option in left pane and cannot edit user or groups.

☑️ Task 5 - Logout as user bob.
===
* Make sure you are logged out from the user "bob" before moving on to the next challenge.


☑️ Summary
===
* We created the "Network Automation" group and a user "bob" in that group.
* This group has the permissions to Change namespace and Upload to namespace.
* This group is the owner of the cloud namespace on private automation hub.

✅ Next Challenge
===
Press the `Next` button below to go to the next challenge once you’ve completed the tasks.

🐛 Encountered an issue?
====
If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new).

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
    width: 100%;
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