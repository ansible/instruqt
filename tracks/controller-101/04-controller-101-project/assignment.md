---
slug: controller-101-project
id: 6gk4xy9gbhhc
type: challenge
title: 1.2 - Creating your first Project
teaser: Let's import our first playbooks into automation controller
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
 💡 1.2 - Projects
===

A **[Project](https://docs.ansible.com/automation-controller/latest/html/userguide/projects.html)** in automation controller is one or more Ansible playbooks inside a directory or Source Control Management system.

We use **Projects** to "*import*" our playbooks into automation controller. These playbooks might be in a source control management (SCM) like Git (in Github or Gitlab for ex.) or locally. Automation controller doesn't allow us to create or edit playbooks through the web-UI, we can only "*import*" them into **Projects** which we later run through the Job Templates feature, which we will review further ahead.

In this challenge, you will create your first **Project** which will import a Github repository with a few Apache playbooks developed in the "Writing your first playbook" laboratory. This playbook installs apache, starts the service and copies an index.html file.


☑️ Task 1 - Creation of the Project
===

1. Click the **Projects** link in the **Resources** section of the sidebar
2. Click the **Add** button
3. **Name** the Project as `Apache playbooks`
4. For the **Source Control Type** dropdown, select **Git**, this will enable new fields below.
5. For the **Source Control URL** field copy & paste the following URL:
   ```
	 https://github.com/leogallego/instruqt-wyfp.git
	 ```
6. Leave all the other fields the same and click **Save**

☑️ Task 2 - Verify the new Project synced successfully
===

1. Click the **Projects** link in the **Resources** section of the sidebar
2. Verify that the **Status** for our `Apache playbooks` project is green and reads **Successful**
3. Click the **Successful** and review the output of the sync

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=intro-to-controller&title=Issue+with+Intro+to+Controller+slug+ID:+controller-101-project&assignees=leogallego).

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
