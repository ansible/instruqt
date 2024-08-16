---
slug: controller-101-template-survey
id: 6dxviwkrftb2
type: challenge
title: '1.8 - BONUS: Creating a Job Template with a Survey'
teaser: Level-up, let's try a fourth Job Template for installing Apache, including
  a Survey this time
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
- title: Node1 Web
  type: service
  hostname: node1
  path: /
  port: 80
  url: http://node1
difficulty: ""
timelimit: 600
---
📑 Bonus track: Job Template with a Survey
===
#### Estimated time to complete: *5 minutes*<p>

BONUS TRACK!

This is an ***optional bonus track***. If you want to try the **Survey** feature of **Automation controller** go ahead and review the tasks in this track, otherwise, you can skip and move to the final chapter: **Recap & review**.

In this challenge, we will explore the Survey feature, which allows us to input a variable at runtime when we execute our Job Template (playbook), making it possible to change a parameter or setting at each run.

We will be changing the index.html we deployed previously for a new one.

☑️ Task 1 - Creation of the Job Template
===

1. Click the **Templates** link in the **Resources** section of the sidebar
2. Click the **Add** dropdown button and select **Add job template**
3. **Name** the Job Template as `Install Apache with Survey`
4. For the **Job Type** field, leave the default: **Run**
5. For the **Inventory** field, touch the magnifying glass and select `Lab-Inventory`
6. For the **Project** field, touch the magnifying glass and select `Apache playbooks`
7. For the **Playbook** dropdown field, you will notice that it's auto populated with all the playbooks available in the **Project** repository we selected. Choose the `apache_template.yml` playbook.
8. For the **Credentials** field,  touch the magnifying glass and select `lab-credentials`
9. Leave all the other fields the same and click **Save**

☑️ Task 2 - Create the Survey for the Job Template
===

1. Once the Job Template is saved, you should be taken to the **Details**
2. Look for the **Survey** tab and click on it.
3. Click the **Add** button
4. In the **Question** field, enter `What's your name?`
5. In the **Answer variable name**, enter `student_name`
6. In the **Default answer** type `Skippy`
7. Press the **Save** button
8. Touch the toggle to **Enable** the survey


☑️ Task 3 - Launch the new Template
===

1. Click the **Templates** link in the **Resources** section of the sidebar
2. You can launch it from this list, by clicking the **Rocket** icon, or
3. You can click on the `Install Apache with Survey` template and then click the **Launch** button at the bottom.
4. Enter your name at the pop-up.
5. Verify the execution was successful by visiting the **Node1 Web** tab in the top left of the screen, you should see the Apache message with your name.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=intro-to-controller&title=Issue+with+Intro+to+Controller+slug+ID:+controller-101-template&assignees=leogallego).

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
