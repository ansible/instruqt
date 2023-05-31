---
slug: workflow
id: 85bs1quoasxa
type: challenge
title: Bonus Mission!  - Orchestration using controller Workflows.
teaser: Create an automation controller Workflow to streamline deploying the ACME
  Corp application into production.
notes:
- type: text
  contents: "# \U0001F3AF Create an automation controller workflow\n\n\n<div class=\"slideList\">\n\nIn
    this challenge, we'll help ACME Corp create an automation controller Workflow
    to deploy the chat application and monitoring service using Ansible Lightspeed.\n\nWe'll
    automate following tasks:\n\n- Create an automation controller Workflow.\n- Launch
    the workflow.\n\n</div>\n\n\n![workflow.gif](../assets/workflow.gif)\n\n\n<style
    type=\"text/css\" rel=\"stylesheet\">\n.slideList{\n\tfont-size: 1.2rem;\n\t}\nh1,h2{\n
    \ text-align: center;\n\tfont-size: 36px;\n}\nh3 {\n\tfont-weight: 600;\n\tfont-size:
    1.5rem;\n}\nimg {\n\t\tdisplay: block;\n  margin-left: au;to;\n  margin-right:
    auto;\n  height: 60%;\n}\n</style>"
tabs:
- title: Controller
  type: service
  hostname: lightspeed-101-controller
  path: /
  port: 443
- title: RHEL
  type: service
  hostname: vnc-proxy
  path: /#/client/c/srv01?username=student&password=learn_ansible
  port: 8080
  new_window: true
- title: App
  type: service
  hostname: lightspeed-101-controller
  path: /signup_user_complete
  port: 8065
- title: Monitoring
  type: service
  hostname: lightspeed-101-controller
  path: /
  port: 9090
difficulty: basic
timelimit: 600
---

🔐 Login credentials
===
All the logins use the same credentials.

>**Username**:
> ```yaml
>student
>```
>**Password**:
>```yaml
>learn_ansible
>```

👋 Introduction
===

# Final mission: Orchestration!

In this challenge, we’ll help ACME Corp create an [automation controller workflow](https://docs.ansible.com/automation-controller/latest/html/userguide/workflows.html) to streamline delivering the ACME Corp chat application.

>**ℹ️ Info**
>
> [Controller workflows](https://docs.ansible.com/automation-controller/latest/html/userguide/workflows.html) allow you to logically connect disparate Job Templates together to solve more complex automation challenges and orchestrate processes.

ℹ️ Need help?
===

* You can expand the images by clicking on them for a closer look.
* If you need help creating the controller Workflow, you can run the `🚀 Solve - Create workflow`  at any time for help.

☑️ Task - Create *Deploy app workflow*.
===

* The **Controller** tab is open by default.
* On the side navigation under the **Resources** section, click **Templates**.
* Click on `Add` and select `Add workflow template` from the drop-down menu.

<a href="#workflow_add_workflow">
  <img alt="workflow_add_workflow" src="../assets/workflow_add_workflow.png" />
</a>

<a href="#" class="lightbox" id="#workflow_add_workflow">
  <img alt="workflow_add_workflow" src="../assets/workflow_add_workflow.png" />
</a>

- In the **name** section, use:

```yaml
Deploy app workflow
```

* In the **Organization** section, click on the 🔍 icon and select the `ACME Corp`organization.
* Click on `Save`. This should open the **Deploy app workflow Visualizer** window.

<a href="#workflow_create">
  <img alt="workflow_create" src="../assets/workflow_create.png" />
</a>

<a href="#" class="lightbox" id="#workflow_create">
  <img alt="workflow_create" src="../assets/workflow_create.png" />
</a>

☑️ Task - Create *Deploy app workflow* nodes.
===

>**❗️ Can't find the Visualizer window?**
>
> * If you're not in the **Deploy app workflow Visualizer** window, click on **Templates** under the **Resources** section in the navigation pane.
> * Click the `Visualizer` button on the right-hand side of the **Deploy app workflow** column.
><a href="#workflow_visualizer">
>  <img alt="#workflow_visualizer" src="../assets/workflow_visualizer.png" />
> </a>
><a href="#" class="lightbox" id="#workflow_complete">
>  <img alt="workflow_complete" src="../assets/workflow_visualizer.png" />
></a>

### ***Harden app servers* node**

- Click on `Start`, located in the center of the **Visualizer** screen.

<a href="#workflow_visualizer_start">
  <img alt="workflow_visualizer_start" src="../assets/workflow_visualizer_start.png" />
</a>

<a href="#" class="lightbox" id="#workflow_visualizer_start">
  <img alt="workflow_visualizer_start" src="../assets/workflow_visualizer_start.png" />
</a>

- Select `Harden app servers`
- Set the `Node Alias`  to:

	```yaml
	Harden
	```
* Click on `Save`.

![workflow_node_harden.png](../assets/workflow_node_harden.png)

### ***Configure firewall* node**

* Hover your mouse over the **Harden** box and click on the + icon.

![workflow_firewall_add.png](../assets/workflow_firewall_add.png)

* Keep `On Success` selected at the top and click on `Next`.

<a href="#workflow_firewall_add_success">
  <img alt="#workflow_firewall_add_success" src="../assets/workflow_firewall_add_success.png" />
</a>

<a href="#" class="lightbox" id="#workflow_firewall_add_success">
  <img alt="workflow_firewall_add_success" src="../assets/workflow_firewall_add_success.png" />
</a>

- Select `Configure firewall`.
- Set the `Node Alias`  to:
	```yaml
	Firewall
	```
- Click on `Save`.

![workflow_node_firewall.png](../assets/workflow_node_firewall.png)

### ***Deploy monitoring* node**

- Hover your mouse over the **Firewall** box and click on the + icon.

![workflow_monitoring_add.png](../assets/workflow_monitoring_add.png)

- Keep `On Success` selected at the top and click on `Next`.
- Select `Deploy monitoring`.
- Set the `Node Alias`  to:

	```yaml
	Monitoring
	```
* Click on `Save`.

![workflow_node_monitoring.png](../assets/workflow_node_monitoring.png)

### ***Deploy ACME Corp app* node**

- Again, hover your mouse over the `Firewall` box and click on the + icon.

![workflow_add_app.png](../assets/workflow_add_app.png)

- Keep `On Success` selected at the top and click on `Next`.
- Select `Deploy ACME Corp app`.
- Set the `Node Alias`  to:

	```yaml
	App
	```

![workflow_node_app.png](../assets/workflow_node_app.png)

### **Completed *Deploy app workflow*:**

Your completed *Deploy app workflow* should match the image below:

![workflow_complete.png](../assets/workflow_complete.png)

* Once completed, click `Save` at the top right-hand corner to return to the **Templates** window.

<a href="#workflow_save">
  <img alt="#workflow_save" src="../assets/workflow_save.png" />
</a>

<a href="#" class="lightbox" id="#workflow_deploy_app_add">
  <img alt="workflow_save" src="../assets/workflow_save.png" />
</a>


☑️ Task - Run *Deploy app workflow*.
===

- Saving will return you to the `Deploy app workflow` Details window.
- Click on `Launch`

![workflow_launch.png](../assets/workflow_launch.png)

>**ℹ️ Launching `Deploy app workflow` from the *Templates* Window**
>- You can also launch `Deploy app workflow` by clicking on  **Templates** under the **Resources** section in the navigation pane on the left.
>- Click on the <img src="https://github.com/IPvSean/pictures_for_github/blob/master/launch_job.png?raw=true" style="width:4%; display:inline-block; vertical-align: middle;" /> icon on the right-hand side of the **Deploy app workflow**** column.
><a href="#workflow_run">
>  <img alt="#workflow_run" src="../assets/workflow_run.png" />
></a>
><a href="#" class="lightbox" id="#workflow_run">
>  <img alt="workflow_run" src="../assets/workflow_run.png" />
></a>

* **Green is good!** If all tasks complete successfully, you should see the output below.

![workflow_success.png](../assets/workflow_success.png)

### 🎉 **Congratulations! You've completed the lab. Feel free to explore the Playground

✏️ Feedback
===

**We would love your feedback!**

* Please take the [Ansible Lightspeed Beta sentiment survey](https://red.ht/ansible-ai-feedback).
* Reach out to us at <ansible-content-ai@redhat.com>.

You can also use the *Take Survey* or *Contact Us* buttons by clicking on Lightspeed at the bottom right of the Visual Studio Code window at any time.

<a href="#vscode_survey">
  <img alt="#vscode_survey" src="../assets/vscode_survey.png" />
</a>

<a href="#" class="lightbox" id="#vscode_survey">
  <img alt="disconnected" src="../assets/vscode_survey.png" />
</a>

🎉 Next - Playground
===

### 🎉 Congratulations! You've completed the lab. Feel free to explore the Playground by clicking on `Check`.

✅ Additional resources
===

[More information](https://www.redhat.com/en/engage/project-wisdom) on Ansible Lightspeed Tech Preview.

Explore free resources to get you started:

* [Self-paced exercises](https://www.redhat.com/en/engage/redhat-ansible-automation-202108061218) - Explore all our self-paced labs
* [Trial subscription](http://red.ht/try_ansible) - Are you ready to install in your environment? Get your trial subscription for unlimited access to all the components of Ansible Automation Platform.
* Subscribe to the Red Hat Ansible Automation Platform YouTube channel.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=getting-started-mesh&title=Getting+started+with+Ansible+Lightspeed+-+issue&assignees=craig-br).

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
    max-width: 60%;
    max-height: 60%;
  }
  html {
    font-size: 14px;
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
  p {
    font-size: 14px;
  }
  p span {
    font-size: 14px;
  }
  ul li span {
    font-size: 14px
  }
</style>
