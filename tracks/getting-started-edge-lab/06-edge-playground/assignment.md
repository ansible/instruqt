---
slug: edge-playground
id: ndvesxlpe1kf
type: challenge
title: Playground
teaser: Use the remaining time to flex your new skills or explore the lab.
notes:
- type: text
  contents: |-
    # Choose your own adventure!
    #### Some ideas:
    #### Use this playground to check Red Hat Ansible Automation Platform global settings
    #### Recreate the automation workflow step by step by yourself
    #### Check the playbooks used for this session
    #### Log into the application or the monitoring dashboards and explore
tabs:
- title: Controller
  type: service
  hostname: controller-edge-lab
  port: 443
- title: Jhb app
  type: service
  hostname: jhb-edge-lab
  path: /web/login
  port: 8088
  new_window: true
- title: Jhb mon
  type: service
  hostname: jhb-edge-lab
  path: /network
  port: 9090
  url: https://jhb-edge-lab:9090
  new_window: true
- title: Dublin app
  type: service
  hostname: dublin-edge-lab
  path: /web/login
  port: 8088
  new_window: true
- title: Dublin mon
  type: service
  hostname: dublin-edge-lab
  path: /network
  port: 9090
  url: https://dublin-edge-lab:9090
  new_window: true
difficulty: basic
timelimit: 600
---

🔐 Login credentials for the mission
===

>**Controller and monitoring username**:
> ```yaml
>student
>```
>**Controller and monitoring password**:
>```yaml
>learn_ansible
>```

>**Ignition username**:
> ```yaml
>admin
>```
>**Ignition password**:
>```yaml
>learn_ansible
>```

👋 Introduction
===
You are free to use this setup as a playground.

##### ⏰ Time to play: *10 minutes*

>**❗️ Note**
>
>* If required, log into automation controller using the provided credentials from the _Controller_ tab.
>* You can expand the images by clicking on them for a closer look.
>* Here’s the [link](https://github.com/craig-br/instruqt-track-content/tree/devel/getting-started-edge-lab/playbooks) to the playbooks used in this example.

* If you want to recreate the workflow check the image as reference:

<a href="#wf">
  <img alt="Autodeploy workflow" src="../assets/img/wf.png" />
</a>

<a href="#" class="lightbox" id="wf">
  <img alt="Autodeploy workflow" src="../assets/img/wf.png" />
</a>