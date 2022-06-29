---
slug: update-pipeline
id: t2481h50besa
type: challenge
title: Configure the ACME Corp pipeline
teaser: We'll configure and integarate the ACME Corp pipeline using automation controller.
notes:
- type: text
  contents: |-
    # Challenge summary
    In this challenge, we'll integrate Jenkins into automation controller using the API.


    ![env_tools](../assets/img/slides_2_controller_api.png)

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
- title: Jenkins
  type: service
  hostname: jenkins
  path: /job/ACMECorp/
  port: 8080
- title: Controller
  type: service
  hostname: controller
  port: 443
difficulty: intermediate
timelimit: 600
---
🔐 Login credentials
===
All the logins use the same credentials.

>User: student<p>
>Password: learn_ansible

👋 Introduction
===
#### Estimated time to complete: _10 minutes_<p>

ACME Corp uses _Jenkins_ to run basic development tasks and checks before manually handing over the code to operations for deployment.

In this lab, we’ll edit the pipeline to integrate Jenkins into _automation controller_ using a [Job Template](https://docs.ansible.com/automation-controller/latest/html/userguide/job_templates.html).


>### **❗️ Note**
>No need to worry! We will not do any Jenkins pipeline coding in this lab, so there is no need to understand all the details.

☑️ Task 1 - The ACME Corp pipeline
===
Let’s look at the ACMECorp pipeline steps:

* The _Jenkins_ tab is open by default.
* If not already logged in, log in using the provided credentials.
* The default landing page is the `ACME Corp` pipeline.

![ACMECorp Pipeline ](../assets/img/jenkins_acmecorp_job.png)

* On the left-hand side of the Jenkins UI window, click on `Configure`

![ACMECorp Configure ](../assets/img/jenkins_acmecorp_configure.png)

* Scroll to the bottom of the page until you get to the *Pipeline* section, which contains _groovy_ code.

![ACMECorp Job ](../assets/img/jenkins_acme_initial_pipe.png)

ACME Corp developers have added the following steps to the pipeline:

* **SCM Get Code** - Pull the latest _Let’s Quiz!_ application code from the _GItea_ repo
* **Installing packages** - Install the packages needed to test the application.
* **Static Code Checking** - Run static code analysis
* **Build and Tag** - Increment the _Let’s Quiz!_ application version and create a git tag. This new tag number will prove useful in the following steps.

Unfortunately, manually handing the application to operations makes production deployments complex and fragile.

☑️ Task 2 - Controller and Jenkins integration
===

ACME Corp operations use Ansible Automation Platform extensively and want to integrate their automation into the pipeline. This integration will help keep production deployments consistent.

The `Configure Jenkins Job` controller job template adds a step to the current pipeline that calls controller’s API to start a controller workflow.

Run the `Configure Jenkins Job` job template:

* Click on the *Controller* tab at the top of the browser window.
* If not already logged in, log in using the provided credentials.
* Under `Resources`, click on `Templates`. This action displays the current _Job Templates_ configured in controller.
* Run `Configure Jenkins Job` by clicking on the _Rocket_ icon on the right-hand side.

![Controller Jenkins](../assets/img/controller_jenkins_jt.png)

In the _Job Output_ window, you’ll see that it successfully *changed* the current ACMECorp pipeline.

![JT output](../assets/img/controller_jt_jenkins_output.png)

☑️ Task 3 - Updated ACMECorp pipeline
===

**Next, we'll have a look at the updated Jenkins pipeline:**

* Click on the _Jenkins_ tab at the top of the browser window.
* Click on `ACME Corp` in the top menu, then click on `Configure`. This action refershes the Jenkins UI with the latest changes.
* Scroll down to the pipeline section.

You’ll see a new `Controller - DevOps` stage in the pipeline code.

![Pipeline step](../assets/img/jenkins_acme_plugin.png)


> **❗️ Note**<p>
>The [Ansible Tower Jenkins plugin](https://plugins.jenkins.io/ansible-tower/) is community-driven, and **Red Hat does not support this project**. This plugin is used in this lab for demonstration purposes only.
>
>Although the plugin still refers to _Tower_, it successfully consumed the controller API for this lab task.


The [Ansible Tower Jenkins plugin](https://plugins.jenkins.io/ansible-tower/) uses the automation controller API to run job templates. Let’s look at the configuration.

The name of the configured automation controller in Jenkins - `ACME Corp controller `.
```groovy
towerServer: 'ACME Corp controller',
```
The type of job template to call - `workflow`.
```groovy
templateType: 'workflow',
```
The name of the Workflow Job Template - `DevOps Workflow`.
```groovy
jobTemplate: 'DevOps Workflow',
```

The controller API accepts multiple parameters, including passing extra variables to the API call.
```groovy
extraVars: '''---
pkg_version: $pkgVersion
tag_name: $newPkgVersion
'''
```
ACME Corp will use the `$newPkgVersion` variable created in the previous Jenkins step and pass it to controller as the `tag_name` variable. This information is vital for deploying the application successfully.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the tasks.

🐛 Encountered an issue?
====

If you need to restart the entire workflow, run the `Restart DevOps Workflow` job template in automation controller.

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
