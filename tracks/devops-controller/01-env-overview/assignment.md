---
slug: env-overview
id: 4zm4rievgnix
type: challenge
title: Environment overview
teaser: In this challenge, we'll explore the different DevOps tools ACME Corp uses
  to deploy the *Let's Quiz!* application.
notes:
- type: text
  contents: |-
    # Challenge summary
    In this challenge, we'll look at the tooling ACME Corp use to deploy the *Let's Quiz!* application.


    ![env_tools](../assets/img/env_tools.png)

    <style type="text/css" rel="stylesheet">
    h1,h2{
      text-align: center;
    }
    p {
      text-align: center;
    }
    img {
      display: block;
      margin-left: auto;
      margin-right: auto;
      width: 80%;
    }
    </style>
tabs:
- title: VS Code
  type: service
  hostname: controller
  path: /editor/?folder=/home/rhel/acme_corp
  port: 443
- title: Gitea
  type: service
  hostname: gitea
  path: /student/acme_corp
  port: 3000
- title: Jenkins
  type: service
  hostname: jenkins
  path: /job/ACMECorp/
  port: 8080
- title: Controller
  type: service
  hostname: controller
  port: 443
difficulty: basic
timelimit: 300
---
🔐 Login credentials
===
All the logins use the same credentials.

>User: student<p>
>Password: learn_ansible

👋 Introduction
===
#### Estimated time to complete: *5 minutes*<p>
ACME Corp use a variety of tools in their DevOps pipeline. Let's have a look at each of these tools and how they're configured.

☑️ Task 1 - VS Code editor
===


ACME Corp developers use the `VS Code` IDE. Let's explore.
* The *VS Code* tab is open by default.

You'll see two folders under the *acme_corp* folder in the left pane:
  *  The `app` folder contains the *Let's Quiz!* application code.
  *  The `playbooks` folder contains the playbooks we'll use in our lab.


The `playbooks` folder contains the playbooks they use to automate the *Let's Quiz!* application deployment.

*  Click on the `playbooks` folder.

<!-- ![VSCode folders](../assets/img/vscode_folders.png) -->
<a href="#vscode_folders">
  <img alt="VSCode folders" src="../assets/img/vscode_folders.png" />
</a>

<a href="#" class="lightbox" id="vscode_folders">
  <img alt="VSCode folders" src="../assets/img/vscode_folders.png" />
</a>

>### **❗️ Note**
>The *ACME Corp* repository and *git* configuration is already setup for you.

☑️ Task 2 - Gitea
===

ACME Corp uses *Gitea* for source code management and contains the *Let’s Quiz!* application code repository.

* Click on the *Gitea* tab on the top of the browser window.
* Log into *Gitea* by clicking the `Sign in` button in the top right-hand corner and using the provided credentials.

<!-- ![Gitea signin](../assets/img/gitea_signin.png) -->

<a href="#gitea_signin">
  <img alt="Gitea signin" src="../assets/img/gitea_signin.png" />
</a>

<a href="#" class="lightbox" id="gitea_signin">
  <img alt="Gitea signin" src="../assets/img/gitea_signin.png" />
</a>

* On the right-hand side, click on `Settings` and then `Webhooks`

<!-- ![Gitea webhook](../assets/img/gitea_webhook.png) -->

<a href="#gitea_webhook">
  <img alt="Gitea webhook" src="../assets/img/gitea_webhook.png" />
</a>

<a href="#" class="lightbox" id="gitea_webhook">
  <img alt="Gitea webhook" src="../assets/img/gitea_webhook.png" />
</a>


*Gitea* has a webhook configured to start a Jenkins job when new code is committed to the repository. We'll use this webhook in the following challenges.



☑️ Task 3 - Jenkins
===

ACME Corp uses Jenkins to run a few development tasks on the *Let's Quiz!* application.

* Click on the *Jenkins* tab on the top of the browser window.
* Log into *Jenkins* by clicking the `log in` button in the top right-hand corner and using the provided credentials.

<!-- ![Jenkins login](../assets/img/jenkins_login.png) -->
<a href="#jenkins_login">
  <img alt="Jenkins login" src="../assets/img/jenkins_login.png" />
</a>

<a href="#" class="lightbox" id="jenkins_login">
  <img alt="Jenkins login" src="../assets/img/jenkins_login.png" />
</a>

The `ACMECorp` Jenkins job loads by default. The pipeline performs basic development tasks that we'll cover in more detail in the next exercises.

<!-- ![ACMECorp status](../assets/img/jenkins_acme_landing.png) -->
<a href="#jenkins_acme_landing">
  <img alt="ACMECorp status" src="../assets/img/jenkins_acme_landing.png" />
</a>

<a href="#" class="lightbox" id="jenkins_acme_landing">
  <img alt="ACMECorp status" src="../assets/img/jenkins_acme_landing.png" />
</a>

☑️ Task 4 - Controller
===

ACME Corp operations use automation controller extensively in the environments.

* Click on the *Controller* tab on the top and log in using the provided credentials.
* Log into *controller* by clicking the using the provided credentials and click on the `Log In` button.

<!-- ![Controller login](../assets/img/controller_login.png) -->
<a href="#controller_login">
  <img alt="Controller login" src="../assets/img/controller_login.png" />
</a>

<a href="#" class="lightbox" id="controller_login">
  <img alt="Controller login" src="../assets/img/controller_login.png" />
</a>


* Under `Resources`, click on `Templates`. This menu displays the current *Job Templates* configured in controller.

<!-- ![ACMECorp JTs](../assets/img//controller_jt_list.png) -->
<a href="#controller_jt_list">
  <img alt="ACMECorp JTs" src="../assets/img//controller_jt_list.png" />
</a>

<a href="#" class="lightbox" id="controller_jt_list">
  <img alt="ACMECorp JTs" src="../assets/img//controller_jt_list.png" />
</a>

* Select the `DevOps Workflow` job template by clicking on the checkbox next to it.
* Click on the `Visualizer` button located at the right-hand side of the `DevOps Workflow` job template.

<!-- ![DevOps Workflow button](../assets/img/controller_devops_visualizer.png) -->
<a href="#controller_devops_visualizer">
  <img alt="DevOps Workflow button" src="../assets/img/controller_devops_visualizer.png" />
</a>

<a href="#" class="lightbox" id="controller_devops_visualizer">
  <img alt="DevOps Workflow button" src="../assets/img/controller_devops_visualizer.png" />
</a>

The *DevOps Workflow* job template unifies multiple tasks into a logical, consistent process. We'll have a look at these tasks in more detail during this lab.

<!-- ![DevOps Workflow visual](../assets/img/controller_devops_visualizer_workflow.png) -->
<a href="#controller_devops_visualizer_workflow">
  <img alt="DevOps Workflow visual" src="../assets/img/controller_devops_visualizer_workflow.png" />
</a>

<a href="#" class="lightbox" id="controller_devops_visualizer_workflow">
  <img alt="DevOps Workflow visual" src="../assets/img/controller_devops_visualizer_workflow.png" />
</a>

>### **❗️ Note**<p>
> Automation controller provides capabilities, such as an extensive API, Workflows and Webhooks to orchestrate DevOps tooling and workflows.<p>

✅ Next Challenge
===
Press the `Next` button below to go to the next challenge once you’ve completed the tasks.

🐛 Encountered an issue?
====
If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=devops-controller&title=New+DevOps+with+automation+controller+issue+issue:+incident-creation&assignees=craig-br).

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
