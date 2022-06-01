---
slug: access-automation-controller
id: nudioocrzqv2
type: challenge
title: Access Automation Controller Dashboard
tabs:
- title: Web Console
  type: website
  url: https://console-openshift-console.crc-gh9wd-master-0.crc.${_SANDBOX_ID}.instruqt.io
  new_window: true
- title: Terminal 1
  type: terminal
  hostname: crc
difficulty: basic
timelimit: 300
---
In this challenge, you will access the newly installed automation controller environment.

## Access Automation Controller

To access the automation controller dashboard, acquire the password for the `admin` user.

To access the `admin` user's password, select `Secrets` under the `Workloads` dropdown.

* Within `Secrets`, select the secret labeled `my-automation-controller-admin-password`.

* Within the `Secret details` page, copy the password to your clipboard in order to paste it into the Automation Controller sign in page.

![Secrets](../assets/copy-password.png)

* In order to get the automation controller dashboard URL, select `Routes` within the `Networking` drop down.

* Within `Routes`, under the project `ansible-automation-platform`, a location starting with `https://my-automation-controller-ansible-automation-platform....` is provided for the service labeled `my-automation-controller-service`.

![OCP Routes](../assets/my-automation-controller-route.png)

> **_NOTE:_** The URL location takes you to the automation controller sign in page.

If the automation controller sign in page is not loaded, this means the installation process is still in progress. An example of the screen showing Ansible Automation Platform not complete is shown below.

![AAP In Progress](../assets/aap_in_progress.png)

* Login to the automation controller dashboard using user `admin` and the password copied to your clipboard.

![AAP Dashboard](../assets/aap_dashboard.png)

Congratulations! You have successfully:

* Installed Ansible Automation Platform via an Operator
* Installed automation controller
* Accessed the automation controller dashboard.
