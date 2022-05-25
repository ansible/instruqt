---
slug: controller-getting-started-jt
id: l7shwh9na7oh
type: challenge
title: Using job templates
teaser: In this challenge, we'll run automation using a Job Template
notes:
- type: text
  contents: "# Running automation with job templates\n<br>\n<p align=\"center\">\n
    \ <img width=\"700px\" src=\"https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller_jt.png\">\n</p>\n<br>\n\n[**Job
    templates**](https://docs.ansible.com/automation-controller/latest/html/userguide/job_templates.html)
    are a definition and set of parameters for running an Ansible Playbook.\n\nIn
    controller, job templates are a visual representation of the `ansible-playbook`
    command and all flags you can utilize when executing from the command line.\n\n<style
    type=\"text/css\" rel=\"stylesheet\">\nh1 {\n\ttext-align: center\n}\n</style>"
tabs:
- title: Controller Dashboard
  type: service
  hostname: controller
  port: 443
- title: Controller CLI
  type: terminal
  hostname: controller
- title: Host01 CLI
  type: terminal
  hostname: host01
- title: Host02 CLI
  type: terminal
  hostname: host02
- title: Editor
  type: service
  hostname: controller
  path: /editor/
  port: 443
difficulty: basic
timelimit: 600
---
## Your assignment

*Login credentials:*
User: **admin**
Password: **ansible123!**

All tasks are done in the controller dashboard

* Open **Templates** on the navigation bar
![jtmenu](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inst-templates-menu.png)
***
<br>

* Click on the `Debug-Info` Job Template
![jtclick](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inst-jt-click.png)
***
<br>

* Click on `Edit`
![jtedit](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inst-jt-edit.png)
***
<br>

* Let's have a closer look at some of the options:
  * Notice that we're using the `Lab-Inventory` we created earlier
  * We're going to run the `playbooks/infrastructure/debug_info.yml`
  * We're using the SSH credential to authenticate to **host01** and **host02** in our `Lab-Inventory`
![jtexplore](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inst-jt-explore.png)
***
<br>

* Click on **Cancel** and then **Launch**
![inv_src](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inst-jt-launch.png)
***
<br>

* This **Job Template** gathers debug information from the `web` group that has `host01` and `host02`
  * Have a look at the output and explore the filters
![inv_src](https://raw.githubusercontent.com/craig-br/instruqt-tracks/devel/assets/controller/controller-inst-jt-output.png)
***
<br>

**When you are done, press the "Check" button below. Congratulations! You've completed the track.**

<style type="text/css" rel="stylesheet">
h1 {
	text-align: center
	}
	img {
		width: 100%
	}
</style>