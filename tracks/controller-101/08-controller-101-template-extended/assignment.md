---
slug: controller-101-template-extended
id: ha8ozxlqn4y1
type: challenge
title: 1.6 - Creating a second and third Job Templates
teaser: Each Job Template is a playbook, let's create a second one
notes:
- type: text
  contents: |+
    # Job templates

    ![job-templates-home-with-example-job-template.png](../assets/job-templates-home-with-example-job-template.png)

    In controller, job templates are a visual representation of the `ansible-playbook` command and all flags you can utilize when executing from the command line.

tabs:
- title: Automation controller
  type: service
  hostname: control
  path: /
  port: 443
difficulty: ""
timelimit: 600
---
📑 1.6 - Second and third Job Templates
===

Let's use what we learned previously and create a second and third **Job Templates**.

- Our **second Job Template** will be named `Extended services` and use the `extended_services.yml` playbook found in the `Additional playbooks` project. This playbook will deploy a PostgreSQL database in `node3` server, which belongs to the `[database]` group of our `Lab-Inventory`.

- And our **third Job Template** will be named `Set motd` and use the `motd_facts.yml` playbook also found in the `Additional playbooks` project. This playbook will set a message of the day only in `node1`.

> [!NOTE]
> Notice how we can use Playbooks from the same Project in different Job Templates.

☑️ Task 1 - Creation of the "Extended services" Job Template
===

1. Click the **Templates** link in the **Resources** section of the sidebar
2. Click the **Add** dropdown button and select **Add job template**
3. **Name** the Job Template as `Extended services`
4. For the **Job Type** field, leave the default: **Run**
5. For the **Inventory** field, touch the magnifying glass and select `Lab-Inventory`
6. For the **Project** field, touch the magnifying glass and select `Additional playbooks`
7. For the **Playbook** dropdown field, you will notice that it's auto populated with all the playbooks available in the **Project** repository we selected. Choose the `extended_services.yml`.
8. For the **Credentials** field, touch the magnifying glass and select `lab-credentials`
9. Leave all the other fields the same and click **Save**

☑️ Task 2 - Launch the "Extended services" Job Template
===
1. Click the **Templates** link in the **Resources** section of the sidebar
2. You can launch it from this list by clicking the **Rocket** icon next to each of the Job Templates
3. The execution should have failed. Why did it fail? Read the output message.
4.  We are missing the `node3` server and the `[database]` group in our `Lab-Inventory`. Create them applying what you learned earlier.
5. Launch the Job again and verify it succeeds.
6. If you are having trouble with this step, move ahead to the next tasks and at the end use the **Skip** button instead of **Check**


☑️ Task 3 - Creation of the "Set motd" Job Template
===

Use the instructions from the previous task to create the new `Set motd` Job Template and use the `motd_facts.yml` playbook also found in the `Additional playbooks` project.

☑️ Task 4 - Launch the "Set motd" Job Template
===

1. Click the **Templates** link in the **Resources** section of the sidebar
2. You can launch it from this list, by clicking the **Rocket** icon next to each of the Job Templates
4. Verify the execution was successful

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=intro-to-controller&title=Issue+with+Intro+to+Controller+slug+ID:+controller-101-template-extended&assignees=leogallego).

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
