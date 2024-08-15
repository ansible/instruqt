---
slug: controller-101-intro
id: zojge555a5ou
type: challenge
title: Intro to the Laboratory
teaser: Introduction and tips to the laboratory
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
💡 Laboratory tips before we begin!
===

Before we begin, some basic tips to improve your lab experience:

1.  The instructions sidebar to the right can be resized (drag and drop the border) or completely collapsed (click on the top left arrow of the sidebar) in case you need extra space for the main panel. You can try this now!
2. In the right sidebar, you will find the different sections. In each chapter, there will be an introduction to the challenge and the related tasks below. The sections can be collapsed and expanded by clicking on them.
![image.png](../assets/image.png)
3. When you finish with a challenge (or chapter), you need to click the green **Check** button to move to the next one. This will review the steps. If no review is required the button might be simply labeled **Next**.
4.  You have the option to **Skip** a challenge or chapter, keep in mind this will auto-solve the exercises.
5.  The lab has a 55 minutes limit that can be extended at the end. If you need more time, make sure to accept the popup.
6.  To start with the exercises click the green button labeled **Next**  below.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=intro-to-controller&title=Issue+with+Intro+to+Controller+slug+ID:+controller-101-intro&assignees=leogallego).

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
