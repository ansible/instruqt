---
slug: deploy
id: zpumxgrfkti8
type: challenge
title: How to deploy the Red Hat Ansible Automation Platform on Microsoft Azure
notes:
- type: text
  contents: |-
    Please click the Green Start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="right"> on the *bottom right corner* if it did not already start creating the lab environment. <br />

    Before we get started let's share some of the **benefits** of Red Hat Ansible Automation Platform on Microsoft Azure.

    ---
     `(please scroll down)`

    <p align="center">
      <img width="500px" src="https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/aap-azure-ben.jpg">
    </p>
- type: text
  contents: |-
    To deploy **Red Hat Ansible Automation Platform on Microsoft Azure**, you simply go to the Azure Marketplace, select it from there, and click on **Create**. `(please scroll down)`

    <p align="center">
      <img width="500px" src="https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/AAP-01-AzureMarketPlace.jpg">
    </p>
- type: text
  contents: |
    Enter the details for your deployment, **Subscription, Resource Group, Region, Application name, and the Administrator password**.

    For **Access** you can select **Private** or **Public**.  Private deploys Ansible Automation Platform on Microsoft Azure in a completely private network.  Public exposes the Automation Controller, and the Private Automation Hub user interfaces to the public internet using an application gateway and firewall.

    Click on **Next : Networking >**. `(please scroll down)`

    <p align="center">
      <img width="700px" src="https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/AAP-02-AzureMarketPlace.jpg">
    </p>
- type: text
  contents: |
    Enter the details for your Networking configuration.  This allows you to specify the private network you want to deploy Ansible Automation Platform on Microsoft Azure to.  Be sure it's a network that doesn't colide with any other existing internal networks.  Click on **Create new** to enter the networking information.  Once complete, you will save.

    Then click on **Next : Review + create >**. `(please scroll down)`

    <p align="center">
      <img width="700px" src="https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/AAP-02-2-AzureMarketPlace.jpg">
    </p>
- type: text
  contents: |
    Lastly, agree to the **Co-Admin Access Permission** by checking the box titled **I agree to the terms and conditions above.**

    Then click on **Create**. `(please scroll down)`

    <p align="center">
      <img width="700px" src="https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/AAP-02-3-AzureMarketPlace.jpg">
    </p>
- type: text
  contents: |-
    After you **Create**, the Red Hat Ansible Automation Platform on Microsoft Azure deployment will proceed. This will take a short time to complete.

    Once the deployment is complete you will see the managed application object, and that it has deployed successfully!
     `(please scroll down)`

    <p align="center">
      <img width="800px" src="https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/AAP-03-AzureMarketPlace.jpg">
    </p>
- type: text
  contents: |-
    Once deployment is complete, you will go to the **Parameters and Outputs** screen.

    To launch the **Automation Controller** and the **Private Automation Hub** user interfaces, simply copy the URL, and launch in a browser of your choice.

    Now you can enjoy using **Red Hat Ansible Automation Platform on Microsoft Azure**. `(please scroll down)`

    <p align="center">
      <img width="800px" src="https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/AAP-04-AzureMarketPlace.jpg">
    </p>
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
  path: /
  port: 80
difficulty: basic
timelimit: 300
---
## Your assignment.
### *Estimated time: 5 minutes*

> You just saw a quick walk through of how to deploy Red Hat Ansible Automation Platform on Microsoft Azure.
>
> Let's login to the `Ansible Controller UI`, and the `Azure portal`
---

# Log in to Automation Contoller<p>
- Select the `Ansible Automation Controller` tab. You will notice a number of tabs in the labs toolbar
![Lab Tabs](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/lab-tabs.jpg)

Log in using the following credentials: <br>
*Login credentials:*<p>
`User:  admin` <p>
`Password:  ansible123!` <p>
Make sure you've been able to successfully login.
<br><br><br>
---
# Log in to the Microsoft Azure Portal<p>
- Select the `Azure Portal` tab from the labs toolbar
![Lab Tabs](https://raw.githubusercontent.com/ansible-cloud/azure-demos/main/images/lab-tabs.jpg)

This will launch a new browser tab.  From the `Azure Portal Account` tab, copy your Azure credentials `Email` & `Password` and log in to the Azure portal. <p>
Make sure you've been able to successfully login.<p>
<br>
When you are done, please `move on to the next challenge` to perform some Azure resource automation. Click `Next`.