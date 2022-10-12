---
slug: workflow
id: hjxsoyvqgeho
type: challenge
title: Azure Automation using a Workflow Template
notes:
- type: text
  contents: |-
    # Challenge summary

    `(please scroll down)`

    In this challenge section, you'll perform automation against resources in your Azure environment by first creating a `Workflow Template`.

    A workflow job template links together a sequence of disparate resources that accomplishes the task of tracking the full set of jobs that were part of the release process as a single unit.

    You will then launch the workflow template and monitor it's progress.

    We have broken down the tasks into individual `Job Templates` which you will use to build the `Workflow Template`.  We have already created the Job Templates for you.

    You will `create a Workflow Template` to perform the following
    - Create a Resourge Group
    - Create a Virtual Network
    - Create a Subnet
    - Create a Public IP
    - Create a Network Security Group
    - Create a Virtual NIC
    - Create a Virtual Machine

    You will `Launch the Workflow Template`
    - Monitor the progress of the Workflow to completion
    - See that the resources got created in Azure

    Perform clean up by removing the Azure Resource Group
tabs:
- title: Ansible Automation Controller
  type: service
  hostname: controller
  port: 443
- title: Azure Portal
  type: website
  hostname: azurecloudclient
  url: https://portal.azure.com/#home
  new_window: true
- title: Azure Portal Account
  type: service
  hostname: azurecloudclient
  port: 80
difficulty: basic
timelimit: 1500
---
## Your assignment.
### *Estimated time: 25 minutes*

> Azure Automation using a Workflow Template.
---

Log in to the `Ansible Automation Controller`.
- Select the `Ansible Automation Controller` tab. You will notice a number of tabs in the labs toolbar
![Lab Tabs](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/lab-tabs.jpg)

Log in using the following credentials: <br>
*Login credentials:*<p>
`User:  admin` <p>
`Password:  ansible123!` <p>

<br>

Log in to the `Azure Portal`.
- Select the `Azure Portal` tab from the labs toolbar
![Lab Tabs](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/lab-tabs.jpg)

This will launch a new browser tab.  From the `Azure Portal Account` tab, copy your Azure credentials `Email` & `Password` and log in to the Azure portal. <br />

---
Let's create a `Workflow Template` that will string together a number of already created `Job Templates`

In the Automation Controller UI
* Expand the `Resources` left menu, and select `Templates`
* Click on `Add` and from the dropdown select `Add workflow template`
* In the `Name` field enter `01-My Azure Automation Workflow`, scroll to the bottom, and click on `Save`
* You are now in the Workflow Visualizer.  Click on the green `Start` button to begin defining the workflow tasks
  * You are now in the `Add Node` view.  Select the `wf01-Create Resource Group`, and click on `Save`
  * Now hover over `wf01-...` and click the `+` sign to add the next Node
  * For `Run type` make sure the `On Success` is selected, and click on `Next`
  * Select the `wf02-Create Virtual Network`, and click on `Save`
  * Repeat the same process and add `wf03-....` all the way to `wf07-....`
  ![Workflow Visualizer](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/Workflow-image1.jpg)
  * Once you have added all 7 job templates, please click on `Save`, and then on `Back to Templates`
  ![Workflow Template](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/Workflow-image2.jpg)
  * Launch the `01-My Azure Automation Workflow` by selecting it and clicking on `Launch`, or by simply clicking the `Rocket Launcher` icon.
  ![Launch Icon](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/launch-icon.png)
  * Monitor the Workflow job progress.  *This will take a few minutes to complete.*

**NOTE:** As you are building the Workflow in the Visualizer you may need to zoom in and out using the `Toggle Tools`.
![Toggle Tools](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/Workflow-image3.jpg)

In the Azure Portal
* Find, select, and expand the `azure-demo` resource group.  This time the resource group and all other resources got created through the Workflow Template job execution.  The automation possiblities become endless by taking advantage of building Workflow Templates.  In the Azure portal you will have to click the `Refresh` icon in the toolbar often to refresh the list view.

In the Automation Controller UI
* Let's go ahead and clean up the resources we created.  Launch the `Destroy Azure Resource Group` job template, by selecting it and clicking on `Launch`, or by simply clicking the `Rocket Launcher` icon.  This will remove the resource group and ALL resources within.  Monitor the job progress.  *This will take a few minutes to complete.*

In the Azure Portal
* Make sure that all the resources created by the workflow no longer exist.  In the Azure portal you will have to click the `Refresh` icon in the toolbar often to refresh the list view.

Thank you for taking the time to learn abut the Red Hat Ansible Automation Platform on Microsoft Azure!