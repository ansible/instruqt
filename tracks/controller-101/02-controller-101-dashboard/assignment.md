---
slug: controller-101-dashboard
id: zybnhtyoirmy
type: challenge
title: 1.0 - Exploring the web-UI and Dashboard
teaser: Let's explore the dashboard, inventory and projects!
notes:
- type: text
  contents: |-
    # Welcome to Ansible automation controller

    Welcome to our interactive lab on Ansible automation controller, the web-based UI interface for **Red Hat Ansible Automation Platform**.

    In this lab, we will demonstrate how easy it is to use automation controller (formerly Ansible Tower) by running some of the playbooks from the "*Writing your first playbook*" lab. No playbook development experience required, although it will help if you know the basics.

    We will explore the web-UI interface, create an **Inventory** to manage our servers, import our playbooks through the **Projects**, add **Job Templates** to run the playbooks and finally, create a **Workflow** linking a few of those playbooks through success or failure conditions.
- type: text
  contents: |-
    # Automation controller Dashboard

    ![ug-dashboard-topsummary.png](../assets/ug-dashboard-topsummary.png)

    The Dashboard view begins with a summary of your hosts, inventories, and projects. Each of these is linked to the corresponding objects for easy access.
- type: text
  contents: |-
    # Automation controller Jobs view

    ![ug-dashboard-jobs-view.png](../assets/ug-dashboard-jobs-view.png)

    Access the Jobs view by clicking Jobs from the left navigation bar. This view shows all the jobs that have ran, including projects, templates, management jobs, SCM updates, playbook runs, etc.
- type: text
  contents: |-
    # Automation controller Schedules view

    ![ug-dashboard-schedule-view.png](../assets/ug-dashboard-schedule-view.png)

    Access the Schedules view by clicking Schedules from the left navigation bar. This view shows all the scheduled jobs that are configured.
tabs:
- title: Automation controller
  type: service
  hostname: control
  path: /
  port: 443
difficulty: ""
timelimit: 600
---

👋 1.0 - Introduction to automation controller
===

Welcome to the **Introduction to automation controller**.

Automation controller, formerly known as Ansible Tower, allows users of Red Hat Ansible Automation Platform to define, operate, scale, and delegate automation across their enterprise through a web-based UI or API.

In the following challenges we will build upon the work from **Writing your first playbook** and show you how to run your Ansible playbooks through the web-UI instead of `ansible-navigator` and the command line.

The screen on the left shows the login screen. You can log in with the following credentials and then continue on to the tasks:

> [!IMPORTANT]
> * Username: `admin`
> * Password: `ansible123!`

☑️ Task 1 - Explore the Dashboard
===

Explore the Dashboard view.  Currently the Dashboard wont show much information due to the lack of playbooks and hosts, but you will be able to visit again once you finished the lab and notice the difference.

You will find the following buttons:

* Hosts
* Failed hosts
* Inventories
* Inventory sync fail
* Projects
* Projects sync fail.

If you click any of them it will take you to the corresponding section. We recommend you take a peek at the following sections:

☑️ Task 2 - Explore the inventories section
===

An **Inventory** is a collection of hosts against which playbooks may be launched, the same as an Ansible inventory file you might know from working with Ansible on the command line.

**Inventories** in automation controller have several advantages over file based ones, you get all the functionality from the latter ones, with added features and better reusability.

Click on the **Inventories** button in the Dashboard or the link in the sidebar menu and explore the **Demo inventory** that comes pre-loaded. You will see all the fields available to use when creating one.  Don't forget to look at the tabs!


☑️ Task 3 - Explore the projects section
===

**Projects** are logical groups of Ansible playbooks in automation controller. These playbooks usually reside in a source code version control system like Git (and platforms as Github or Gitlab). With **Projects** we can reference a repository or directory with one or several playbooks, that we will later use.

Click on the **Projects** button in the Dashboard or the link in the sidebar menu and explore the **Demo project** that comes pre-loaded. You will see all the fields available to use when creating one. Don't forget to look at the tabs!


✅ Next Challenge
===

Press the `Next` button below to go to the next challenge once you’ve completed the tasks.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=intro-to-controller&title=Issue+with+Intro+to+Controller+slug+ID:+controller-101-dashboard&assignees=leogallego).

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
