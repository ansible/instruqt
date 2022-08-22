---
slug: create-cloud-namespace-group
id: uvnqtjerjz7s
type: challenge
title: Create the cloud namespace  and group in private automation hub
teaser: Create a cloud user group and a user called marie, which will have access
  to upload to upload ansible content collections to the cloud namespace in private
  automation hub.
tabs:
- title: automationhub-web
  type: service
  hostname: privatehub-01
  path: /
  port: 443
difficulty: basic
timelimit: 400
---

🔐 Login credentials

>User: curator<p>
>Password: learn_ansible

☑️ Task 1 - Create a Cloud Automation user group
===

The Curator wants to create a user group called **Cloud Automation** for the cloud automation team. He needs to make sure that **Cloud Automation** user group has the permission to upload collections to the cloud namespace only.

Please go through the below steps to create a cloud user group.

1. Ensure that you are logged in as the *curator* user in automationhub-web tab.
2. Click on "User Access" > Groups in the left pane.
3. Click on "Create" button.
<!-- ![Group Create Cloud Button](../assets/create_button_group_cloud.png) -->
<a href="#group_create_cloud_button">
  <img alt="Group Create Cloud Button" src="../assets/create_button_group_cloud.png" />
</a>
<a href="#" class="lightbox" id="group_create_cloud_button">
  <img alt="Group Create Cloud Button" src="../assets/create_button_group_cloud.png" />
</a>
4. Type "Cloud Automation" in the name of the group  and then click on Create button.
<!-- ![Group Create Cloud](../assets/create_dialog_group_cloud.png) -->
<a href="#group_create_cloud">
  <img alt="Group Create Cloud" src="../assets/create_dialog_group_cloud.png" />
</a>
<a href="#" class="lightbox" id="group_create_cloud">
  <img alt="Group Create Cloud" src="../assets/create_dialog_group_cloud.png" />
</a>
5. After you create the group, you will see a permissions page where you can assign permissions. Click "Edit". Edit permissions to add the "Upload to namespace" permission to the group here. Click on Save.
<!-- ![Group Create Cloud](../assets/cloud_group_permissions.png) -->
<a href="#cloud_group_permissions">
  <img alt="Cloud group permissions" src="../assets/cloud_group_permissions.png" />
</a>
<a href="#" class="lightbox" id="cloud_group_permissions">
  <img alt="Cloud group permissions" src="../assets/cloud_group_permissions.png" />
</a>


☑️ Task 2 - Create a user marie in Cloud Automation group
===
1. On the left pane click on "User Access" > "Users"
<!-- ![Create User Marie](../assets/create_user_marie.png) -->
<a href="#create_user_marie_button">
  <img alt="Create User Marie Button" src="../assets/create_user_marie.png" />
</a>
<a href="#" class="lightbox" id="create_user_marie_button">
  <img alt="Create User Marie Button" src="../assets/create_user_marie.png" />
</a>
2. Set the username field as "marie" and password field as "learn_ansible", assign the group "Cloud Automation" to the user marie.
<!-- ![Create User Marie Dialog](../assets/create_user_marie_dialog.png) -->
<a href="#create_user_marie_dialog">
  <img alt="Create User Marie Dialog" src="../assets/create_user_marie_dialog.png" />
</a>
<a href="#" class="lightbox" id="create_user_marie_dialog">
  <img alt="Create User Marie Dialog" src="../assets/create_user_marie_dialog.png" />
</a>

☑️ Task 3 - Create a cloud namespace
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
<!-- ![Namespace Create Button](../assets/namespace_create_button.png) -->
<a href="#namespace_create_button">
  <img alt="Namespace Create Button" src="../assets/namespace_create_button.png" />
</a>
<a href="#" class="lightbox" id="namespace_create_button">
  <img alt="Namespace Create Button" src="../assets/namespace_create_button.png" />
</a>
3. In the Dialog, set the namespace name as "cloud" and set the owners of the namespace to the "Cloud Automation" group.
<!-- ![Namespace Create Dialog 1](../assets/namespace_create_cloud_dialog1.png) -->
<a href="#namespace_create_dialog1">
  <img alt="Namespace Create Dialog 1" src="../assets/namespace_create_cloud_dialog1.png" />
</a>
<a href="#" class="lightbox" id="namespace_create_dialog1">
  <img alt="Namespace Create Dialog 1" src="../assets/namespace_create_cloud_dialog1.png" />
</a>
4. Change the default permissions by removing "Change Namespace" permission and only keeping the "Upload to Namespace" permission for Cloud group and the click on Create button.
<!-- ![Namespace Create Dialog 2](../assets/namespace_create_cloud_dialog2.png) -->
<a href="#namespace_create_dialog2">
  <img alt="Namespace Create Dialog 2" src="../assets/namespace_create_cloud_dialog2.png" />
</a>
<a href="#" class="lightbox" id="namespace_create_dialog2">
  <img alt="Namespace Create Dialog 2" src="../assets/namespace_create_cloud_dialog2.png" />
</a>
5. Logout from the curator user.
<!-- ![Curator Logout](../assets/curator_logout.png) -->
<a href="#curator_logout">
  <img alt="Curator Logout" src="../assets/curator_logout.png" />
</a>
<a href="#" class="lightbox" id="curator_logout">
  <img alt="Curator logout" src="../assets/curator_logout.png" />
</a>

☑️ Task 4 - Login as cloud group user marie
===
Login as user "marie" from Cloud group in private automation hub instance.
<br>
🔐 Login credentials

>User: marie<p>
>Password: learn_ansible
<!-- ![Marie Login](../assets/marie_login.png
) -->
<a href="#marie_login">
  <img alt="Marie Login" src="../assets/marie_login.png" />
</a>
<a href="#" class="lightbox" id="marie_login">
  <img alt="Marie Login" src="../assets/marie_login.png" />
</a>

* Notice that the user "marie" doesn't have access to "User Access" option in left pane and cannot edit user or groups.

☑️ Task 5 - Logout from marie user
===
* Logout from the marie user as we will create a new user Bob in network group in the next challenge


☑️ Summary
===
* We created the "Cloud Automation" group and a user "marie" in that group.
* This group has the permissions to change namespace and upload to namespace.
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