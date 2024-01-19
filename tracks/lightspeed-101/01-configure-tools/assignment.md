---
slug: configure-tools
id: bgt8posb7km4
type: challenge
title: Configuring Ansible Lightspeed in Visual Studio Code.
teaser: We'll enable Ansible Lightspeed in the Ansible Visual Studio Code extension
  and activate it using GitHub credentials
notes:
- type: text
  contents: "## \U0001F3AF **First challenge: Configuring Ansible Lightspeed in Visual
    Studio Code.**\n\n<div class=\"slideList\">\n\nWe'll enable Ansible Lightspeed
    in the Ansible Visual Studio Code extension and activate it using GitHub credentials.\n\n![lab_enable_extension_login.gif](../assets/lab_enable_extension_login.gif)\n<div
    class=\"slideList\">\n\n<style type=\"text/css\" rel=\"stylesheet\">\n.slideList{\n\tfont-size:
    1.2rem;\n\ttext-align: center;\n\t}\nh1{\n  text-align: center;\n\tfont-size:
    36px;\n}\nh2 {\n\ttext-align: center;\n\tfont-size: 1.67rem;\n}\nh3 {\n\tfont-weight:
    600;\n\tfont-size: 1.2rem;\n}\nimg {\n\t\tdisplay: block;\n  margin-left: au;to;\n
    \ margin-right: auto;\n  height: 60%;\n}\n</style>"
tabs:
- title: Controller
  type: service
  hostname: lightspeed-101-controller
  path: /
  port: 443
- title: RHEL
  type: service
  hostname: vnc-proxy
  path: /#/client/c/RHEL?username=student&password=learn_ansible
  port: 8080
  new_window: true
- title: Repo
  type: service
  hostname: lightspeed-101-controller
  path: /student/acme_corp
  port: 8443
difficulty: basic
timelimit: 3300
---

👋 Introduction
===

The examples used in this lab are available in the [Ansible Lightspeed Demo repository](https://github.com/craig-br/lightspeed-demos).

>### **❗️ Note**
>You'll need a GitHub or Red Hat Customer Portal account for this lab. If you don't have an account yet,  please create one.

- On the top left hand-side of the window, you'll see the `Controller` and `RHEL` tabs.
- The `Controller` tab in the lab browser window connects you to [automation controller](https://https://www.ansible.com/products/controller) (previously known as Ansible Tower).
- We'll use automation controller in later challenges.

![controller_login.png](../assets/controller_login.png)

- Click on the `RHEL` tab. This opens a new browser tab called `RHEL` and provides access to a Red Hat Enterprise Linux system with Visual Studio Code installed.

- If prompted, allow clipboard access to your RHEL instance.

![rhel_clipboard.png](../assets/rhel_clipboard.png)

![RHEL9_desktop.png](../assets/RHEL9_desktop.png)

- The login credentials for controller and Cockpit, which we'll use later in the lab, are below:

>**Username**:
> ```yaml
>student
>```
>**Password**:
>```yaml
>learn_ansible
>```

❗️ Copy and paste to **RHEL** instance
===

## **RHEL browser tab copy and paste**

Certain browsers, such as Firefox and Safari,  don't allow clipboard related features (copy, paste, etc.) in the **RHEL** VNC browser tab by default.

You can use the **VNC Clipboard utility** to copy and paste to and from your local machine and the lab **RHEL** instance.

>### **❗️ Note**
>The **Chrome** browser supports standard copy and paste features by default.

On the **RHEL** tab, follow these steps to open the **VNC Clipboard utility**:
-  On a Windows or Linux device with an external keyboard, the press `CTRL+ALT+SHIFT`.
-  On a Mac device with an external keyboard, press `CTRL+OPTION+SHIFT`.
- The **Clipboard** text area functions as an interface between the remote clipboard and local clipboard.
![vnc_sidebar_clipboard.png](../assets/vnc_sidebar_clipboard.png)
- You can close the **VNC Clipboard utility** by pressing `CTRL+ALT+SHIFT` for Windows, or  `CTRL+OPTION+SHIFT` for Mac.

ℹ️ Need help?
===

## Solution videos

- One or more solution videos available under the `Solution videos` section of the instructions.

## How do I skip this challenge?

- Click the `Skip` button located at the bottom right-hand side of the screen to move to the next challenge.

<a href="#skip_challenge">
  <img alt="#skip_challenge" src="../assets/skip_challenge.png" />
</a>

☑️ Task - Enable Ansible Lightspeed
===

- Navigate to your `RHEL` external tab.
- Follow the screenshot instructions below to enable Ansible Lightspeed in Visual Studio Code.
- Double-click on the Visual Studio Code icon on the desktop.
![vscode_open.png](../assets/vscode_open.png)
- Navigate to the Ansible Visual Studio Code extension settings.
![open_extension_settings.png](../assets/open_extension_settings.png)
- We are configuring the Ansible Visual Studio Code extension in the `Workspace` section.
![vscode_workspace_settings.png](../assets/vscode_workspace_settings.png)
- Scroll down to find the Lightspeed settings and enable them.
![extension_enable_lightspeed.png](../assets/extension_enable_lightspeed.png)

>**❗️Note!**
>
>Please ensure you configure the settings in the Visual Studio Code `Workspace` settings.

☑️ Task - Activate the Ansible Lightspeed service
===

>### **❗️ Note**
>
>This lab environment is ephemeral and will be deleted as soon the time limit is reached.
>No credentials are stored after the lab environment is removed.

- Follow the screenshots below to activate to the Ansible Lightspeed service.

![connect_extension.png](../assets/connect_extension.png)
![allow_vscode_external_link.png](../assets/allow_vscode_external_link.png)
- This will open a Firefox browser and ask you to login to your GitHub account, please follow through the screenshots below:
![login_click_tech_preview.png](../assets/login_click_tech_preview.png)
![github_login_page.png](../assets/github_login_page.png)
![tandc_agree.png](../assets/tandc_agree.png)
![authorize_lightspeed.png](../assets/authorize_lightspeed.png)
![firefox_lighspeed_open_vscode.png](../assets/firefox_lighspeed_open_vscode.png)
![allow_external_url_vscode.png](../assets/allow_external_url_vscode.png)
- Once you have logged in and authorized the Ansible Lightspeed service, you'll see `Logged in as <GitHub Username>` on the Visual Studio Code extension.
![Logged_in_as_vscode.png](../assets/Logged_in_as_vscode.png)

>**❗️Note!**
>
>- If you receive a timeout warning as below, you're OK!
>- Click on `Connect` in the Ansible Visual Studio Code extension again.
>- Click on `Authorize` in Firefox. You won't need to re-authenticate with your GitHub credentials.
>![vscode_login_timeout.png](../assets/vscode_login_timeout.png)

👀 Solution videos
===

## **Enable Ansible Lightspeed Visual Studio Code**
![lab_enable_extension_solution_enable.gif](../assets/lab_enable_extension_solution_enable.gif)

## Activate Ansible Lightspeed using GitHub credentials
![lab_enable_extension_login.gif](../assets/lab_enable_extension_login.gif)

✅ Next Challenge
===

Press the `Check` button below to go to the next challenge once you’ve completed the tasks.

✅ Additional resources
===

[More information](https://www.redhat.com/en/engage/project-wisdom) on Ansible Lightspeed Technical Preview.

Explore free resources to get you started:

* [Self-paced exercises](https://www.redhat.com/en/engage/redhat-ansible-automation-202108061218) - Explore all our self-paced labs
* [Trial subscription](http://red.ht/try_ansible) - Are you ready to install in your environment? Get your trial subscription for unlimited access to all the components of Ansible Automation Platform.
* Subscribe to the Red Hat Ansible Automation Platform YouTube channel.

🐛 Encountered an issue?
====
If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=lightspeed-101&title=New+Intro+to+Lightspeed+issue:+configure-tools&assignees=craig-br).

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
