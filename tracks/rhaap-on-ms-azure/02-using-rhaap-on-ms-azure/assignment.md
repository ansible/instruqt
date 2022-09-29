---
slug: using-rhaap-on-ms-azure
id: mafsch75wznz
type: challenge
title: Using the Red Hat Ansible Automation Platform on Microsoft Azure
notes:
- type: text
  contents: |
    # Challenge summary

    In this challenge, you'll perform automation against resources in your Azure environment.
    You will `launch a number of job templates` to perform the following
    - Create an Azure Resourge Group
        - See that it is created in Azure
    - Create a Windows 2022 server, and all associated resources
        - See that the resources are created in Azure
    - Perform clean up by removing the Azure Resource Group
tabs:
- title: Ansible Automation Controller
  type: service
  hostname: controller
  port: 443
- title: Azure Portal
  type: website
  url: https://portal.azure.com/#home
  new_window: true
- title: Azure Portal Account
  type: service
  hostname: azurecloudclient
  port: 80
difficulty: basic
timelimit: 900
---
## Your assignment.
### *Estimated time: 15 minutes*

> Deploy Azure resources through Ansible Automation Platform.
---

Log in to the `Ansible Automation Controller`.
- Select the `Ansible Automation Controller` tab. You will notice a number of tabs in the labs toolbar
![Lab Tabs](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/lab-tabs.jpg)

Log in using the following credentials: <br>
*Login credentials:*<p>
`User:  admin` <p>
`Password:  ansible123!` <p>

<br><br>
---

Log in to the `Azure Portal`.
- Select the `Azure Portal` tab from the labs toolbar
![Lab Tabs](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/lab-tabs.jpg)

This will launch a new browser tab.  From the `Azure Portal Account` tab, copy your Azure credentials `Email` & `Password` and log in to the Azure portal. <br />

---

In the Automation Controller UI
* Expand the `Resources` left menu, and select `Templates`
* Launch the `Create Azure Resource Group` job template, by selecting it and clicking on `Launch`, or by simply clicking the `Rocket Launcher` icon.
![Launch Icon](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/launch-icon.png)

* Monitor the job progress.  Once complete, please move to the next step.  *This will take a few minutes to complete.*

In the Azure Portal
* See that the Resource Group got created in Azure.  Find, select, and expand the `azure-demo` resource group.  Notice that currently there are no other resources within this resource group. In the Azure portal you will have to click the `Refresh` icon in the toolbar often to refresh the list view.

In the Automation Controller UI
* Launch the `Create Windows Server 2022 VM` job template, by selecting it and clicking on `Launch`, or by simply clicking the `Rocket Launcher` icon.

* This job template will orchestrates and automation the creation of a number of Azure resources required before creating the Windows 2022 Server.  Monitor the job progress.  Once complete, please move to the next step.  *This will take a few minutes to complete.*

In the Azure Portal
* Find, select, and expand the `azure-demo` resource group.  Now you will see the many resources that got created in addition to the Windows 2022 server.  This single template orchestrated the creation of all the resources.  In the Azure portal you will have to click the `Refresh` icon in the toolbar often to refresh the list view.

In the Automation Controller UI
* Launch the `Destroy Azure Resource Group` job template, by selecting it and clicking on `Launch`, or by simply clicking the `Rocket Launcher` icon.  This will remove the resource group and ALL resources within.  Monitor the job progress.  *This will take a few minutes to complete.*

In the Azure Portal
* Make sure the `azure-demo` resource group no longer exists.  In the Azure portal you will have to click the `Refresh` icon in the toolbar often to refresh the list view.

When you are done, please `move on to the next challenge` to perform some Azure resource automation. Click `Next`.