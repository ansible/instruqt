---
slug: controller-101-workflow
id: f32a0cjlbre0
type: challenge
title: 1.7 - Creating a Workflow Job Template
teaser: 'Connecting all the dots: Link multiple playbooks by conditions'
notes:
- type: text
  contents: |-
    # Workflows

    ![wf-templates-home-with-example-wf-template.png](../assets/wf-templates-home-with-example-wf-template.png)

    A workflow job template links together different resources in a graphical way, this can include multiple playbooks (job templates), project syncs and even other workflows.
tabs:
- title: Automation controller
  type: service
  hostname: control
  path: /
  port: 443
difficulty: ""
timelimit: 600
---
🔗 1.7 - Workflows
===

A [Workflow Job Template](https://docs.ansible.com/automation-controller/latest/html/userguide/workflow_templates.html) links together a sequence of disparate resources that accomplishes the task of tracking the full set of jobs that were part of the release process as a single unit. These resources may include:

- job templates
- workflow templates
- project syncs
- inventory source syncs

Only **Workflow Templates** have the Workflow Visualizer icon (wf-viz-icon) as a shortcut for accessing the workflow editor.

**Note**: Remember, do not confuse a **Job Template** with a **Jinja template**, or now with **Workflow Job Template**.  They are 3 separate things.

☑️ Task 1 - Creating a Workflow Template
===

1. Click the **Templates** link in the **Resources** section of the sidebar
2. Click the **Add** dropdown button and select **Add workflow template**
3. **Name** the Workflow Template as `Your first workflow`. Leave everything else the same and click **Save**.
4. This will take you to the Workflow Visualizer screen, where you have to click **Start**
5. You will be presented with the **Add Node** pop-up screen.
6. For the **Node Type**, select **Job Template** (default)
7. Select the `Install Apache`  Job Template
8. Click the **Save** button.
9. You will be presented with a graphical representation, showing a **Start** box followed by the `Install Apache` box, now when you hover your mouse pointer over this job template, you will see the following options: Add a new node, view node details, edit node, link to available node and delete node.
10. Click the **Add a new node**
11. You will be presented with 3 options: On success, on failure and always. Select **On Success** and click **Next**
12. Select the `Extended services` Job Template. Click **Save**
13. You have created a **Workflow Job Template** consisting of 2 **Job Templates**. You can zoom in and out with the mouse wheel.
14. Let's add a third node. Click the **Add a new node** again, from the same `Install Apache` box as before. We are going to run 2 playbooks in parallel after that one, the `Extended services` you just created and a new one.
15. Select **On Success** again as the condition.
16. Select the `Set motd` Job Template. Click **Save**
17. Your workflow should have 3 Job Templates now.
18. Click the top right **Save** button to save changes and exit the Visualizer screen.

☑️ Task 2 - Launch the new Workflow
===

1. Click the **Templates** link in the **Resources** section of the sidebar
2. You can launch the Workflow from this list by clicking the **Rocket** icon, or
3. You can click on the `Your first workflow`  name and click the **Launch** button.
4. You will be presented with a smaller Workflow Visualizer that shows the progress of the execution as **Running**
5. Verify the execution was successful by checking all the **Job Templates** have a green border and a green tick.

☑️ Task 3 - Success or failure? Challenge time!
===

1. If it failed, why did it fail? Click the red **Failed** and read the output message.
2. It reports the playbook couldn't find the destination hosts or group in the inventory
3. Try to fix it. You need a `database` group in the inventory and to add a `node3` to it.
4. Re run the Workflow.
5. If you are having trouble solving it, you can Skip and it will be solved for you.

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
