---
slug: controller-101-project-additional
id: k3yrknwswcrl
type: challenge
title: 1.5 - Creating a second Project
teaser: Importing a second repository into a new project
notes:
- type: text
  contents: |-
    # Projects

    ![projects-list-all.png](../assets/projects-list-all.png)

    You can manage playbooks on your server, or by placing your playbooks into a source code management (SCM) system supported by automation controller, including Git, Subversion, and Red Hat Insights.
tabs:
- title: Automation controller
  type: service
  hostname: control
  path: /
  port: 443
difficulty: ""
timelimit: 600
---
💡 1.5 - Projects
===

We already have a **Project** called `Apache playbooks` from a previous challenge, where we can find the `apache.yml` and `test_apache_role.yml`  playbooks.

In this new challenge, we are going to create a second project named `Additional playbooks`, which will include the following playbooks: `extended_services.yml` (installs postfix and postgresql), `motd_facts.yml` (sets a message of the day) and `loop_users.yml` (creates multiple users).



☑️ Task 1 - Creating the second Project
===

1. Click the **Projects** link in the **Resources** section of the sidebar
2. Click the **Add** button
3. **Name** the Project as `Additional playbooks`
4. For the **Source Control Type** dropdown, select **Git**, this will enable new fields below.
5. For the **Source Control URL** field, copy & paste the following URL
  ```
  https://github.com/leogallego/instruqt-wyfp-additional.git
  ```
6. Leave all the other fields the same and click **Save**

☑️ Task 2 - Verify the new Project synced successfully
===

1. After saving, you should be taken to the **Details** of the project we just created
2. The **Last Job Status** should display **Running** in blue, give it a few seconds
3. If it changed to **Successful** and is showing in green, the project synced correctly.

As an alternative, to see the status of multiple projects, you can:
1. Click the **Projects** link in the **Resources** section of the sidebar
2. Check the **Status** column for the project is green and reads **Successful**
3. Click the **Successful** and review the output of the sync

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=intro-to-controller&title=Issue+with+Intro+to+Controller+slug+ID:+controller-101-project-2&assignees=leogallego).

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
