---
slug: env-overview
id: 4zm4rievgnix
type: challenge
title: Environment overview
teaser: In this challenge, we'll explore the different DevOps tools ACMECorp uses
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
- title: Controller
  type: service
  hostname: controller
  port: 443
- title: Jenkins
  type: service
  hostname: jenkins
  path: /job/ACMECorp/
  port: 8080
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
ACME Corp use a variety of tools in ther DevOps pipeline. Let's have a look at each of these tools and how they're configured.

☑️ Task 1 - VS Code editor
===

* ACME Corp use the `VS Code` IDE.
* The `VS Code` tab is open by default.
* The *ACME Corp* repository and *git* configuration is already setup for you.
* You'll see two folders under the *acme_corp* folder in the left pane:
  *  The `app` folder contains the *Let's Quiz!* application code.
  *  The `playbooks` folder contains the playbooks we'll use in our lab.
*  Click on the `playbooks` folder.

The `playbooks` folder contains the playbooks they use to automate the *Let's Quiz!* application deployment.

![VSCode folders](../assets/img/vscode_folders.png)


☑️ Task 2 - Gitea
===

* Click on the `Gitea` tab on the top of the browser window.
* Log into *Gitea* by clicking the `Sign in` button in the top right-hand corner and using the provided credentials.

![Gitea signin](../assets/img/gitea_signin.png)

* ACME Corp uses *Gitea* for source code management and contains the *Let’s Quiz!* application code repository.
* On the right-hand side, click on `Settings` and then `Webhooks`

![Gitea signin](../assets/img/gitea_webhook.png)

*Gitea* has a webhook configured to start a Jenkins job when new code is committed to the repository. We'll use this webhook in the following challenges.



☑️ Task 3 - Jenkins
===

* Click on the `Jenkins` tab on the top of the browser window.
* Log into *Jenkins* by clicking the `log in` button in the top right-hand corner and using the provided credentials.

![Jenkins login ](../assets/img/jenkins_login.png)


The `ACMECorp` Jenkins job loads by default. The pipeline performs basic development tasks that we'll cover in more detail in the next exercises.

☑️ Task 4 - Controller
===

* Click on the `Controller` tab on the top and log in using the provided credentials.
* Log into *controller* by clicking the using the provided credentials and click on the `Log In` button.

![Controller login ](../assets/img/controller_login.png)

* Under `Resources`, click on `Templates`. This menu displays the current *Job Templates* configured in controller.

![ACMECorp JTs ](../assets/img//controller_jt_list.png)

* Select the `DevOps Workflow` job template by clicking on the checknbpox next to it
* Click on the `Visualizer` button located at the right-hand side of the `DevOps Workflow` job template.

![DevOps Workflow button](../assets/img/controller_devops_visualizer.png)

The *DevOps Workflow* job templates unifies multiple tasks into a logical, consistent process. We'll have a look at these tasks in more detail during this lab.

![DevOps Workflow visual](../assets/img/controller_devops_visualizer_workflow.png)

>### **❗️ Note**<p>
>
> Automation controller provides capabilities, such as an extensive API, Workflows and Webhooks to orchestrate DevOps tooling and workflows.<p>

✅ Next Challenge
===
Press the `Next` button below to go to the next challenge once you’ve completed the tasks.

🐛 Encountered an issue?
====
If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=devops-controller&title=New+DevOps+with+automation+controller+issue+issue:+incident-creation&assignees=craig-br).

<style type="text/css" rel="stylesheet">
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
