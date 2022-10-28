---
slug: install-monitor-app
id: 7m0385aw639q
type: challenge
title: Monitoring edge network traffic
teaser: Next, we'll install a monitoring software in the Dublin and Johannesburg devices
notes:
- type: text
  contents: "# Second mission:  Dublin locations require monitoring.\n##### You are
    based in Raleigh and are tasked to deploy the RHEL monitoring \U0001F50E application
    remotely.\n##### Connectivity is a precious resource and it is critical to monitor
    traffic statistics \U0001F4CA to understand bandwith utilization \U0001F4C8.\n#####
    Your mission, should you choose to accept it \U0001F94B, is to deploy the IT performance
    \"eyes\" \U0001F440 into the Dublin plant.\n##### Click on Start button begin.\n<style
    type=\"text/css\" rel=\"stylesheet\">\nh1,h2{\n  text-align: center;\n}\np {\n
    \ text-align: center;\n}\nimg {\n  display: block;\n  margin-left: auto;\n  margin-right:
    auto;\n  height: 60%;\n\n}\n</style>"
tabs:
- title: Controller
  type: service
  hostname: controller-edge-lab
  port: 443
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

👋 Introduction
===

### Second mission: Deploy the monitoring dashboard into Dublin factory
In this challenge, we’ll review how to deploy the monitoring dashboards application into a single remote location using the corresponding instance group.

##### ⏰ Estimated time to complete: *10 minutes*

>**❗️ Note**
>
>* If required, log into automation controller using the provided credentials from the _Controller_ tab.
>* You can expand the images by clicking on them for a closer look.
>* Here’s the [link](https://github.com/craig-br/instruqt-track-content/blob/65e9c23585f22e0c725108c1277a4c524bf58513/getting-started-edge-lab/playbooks/deploy_monitoring.yml) to the playbook used in this example.

☑️ Task - Deploy monitoring dashboards job template
===

##### ✏️ Explore *Deploy monitoring dashboards* job template in **automation controller**.

* On the side navigation under the **Resources** section, click on **Templates**.
* Click on the `Deploy monitoring dashboards` dropdown arrow.

<a href="#deploy_mondash_template">
  <img alt="Deploy monitoring dashboards" src="../assets/img/deploy_mondash_template.png" />
</a>

<a href="#" class="lightbox" id="deploy_mondash_template">
  <img alt="Deploy monitoring dashboards" src="../assets/img/deploy_mondash_template.png" />
</a>

The `Deploy monitoring dashboards` job template uses the `Dublin region` inventory by default. The `dublin-edge-lab`execution node is associated with the `Dublin region` inventory and runs the job template.

<a href="#deploy_mondash_template_dublin">
  <img alt="Deploy monitoring dashboards inventory" src="../assets/img/deploy_mondash_template_dublin.png" />
</a>

<a href="#" class="lightbox" id="deploy_mondash_template_dublin">
  <img alt="Deploy monitoring dashboards inventory" src="../assets/img/deploy_mondash_template_dublin.png" />
</a>

##### ✏️ Launch *Deploy monitoring dashboards* job template.

* On the side navigation under the **Resources** section, click on **Templates**.
* Click on the `Deploy monitoring dashboards` <img src="https://github.com/IPvSean/pictures_for_github/blob/master/launch_job.png?raw=true" style="width:4%; display:inline-block; vertical-align: middle;" /> icon to launch the template.
* Leave the default `Dublin region` selected in the Inventory prompt and click on the `Next` button.
<a href="#Deploy monitoring dashboards template region prompt">
  <img alt="Deploy monitoring dashboards template region prompt" src="../assets/img/deploy_mondash_template_prompt.png" />
</a>

<a href="#" class="lightbox" id="Deploy monitoring dashboards template region prompt">
  <img alt="Deploy monitoring dashboards template region prompt" src="../assets/img/deploy_mondash_template_prompt.png" />
</a>

* Click the `Launch` button to trigger the automation job.

<a href="#Launch Deploy monitoring dashboards template">
  <img alt="Launch Deploy monitoring dashboards template" src="../assets/img/deploy_mondash_template_launch.png" />
</a>

<a href="#" class="lightbox" id="Launch Deploy monitoring dashboards template">
  <img alt="Launch Deploy monitoring dashboards template" src="../assets/img/deploy_mondash_template_launch.png" />
</a>

>ℹ️ The `Deploy monitoring dashboards template` will execute multiple tasks including information gathering, templating, pulling the container image, and restarting services. Check all the tasks executed under the **Views** section, inside **Jobs**.

<a href="#View Deploy monitoring dashboards template job execution">
  <img alt="View Deploy monitoring dashboards template job execution" src="../assets/img/deploy_mondash_template_job.png" />
</a>

<a href="#" class="lightbox" id="View Deploy monitoring dashboards template job execution">
  <img alt="View Deploy monitoring dashboards template job execution" src="../assets/img/deploy_mondash_template_job.png" />
</a>


☑️ Final task - Login into the Dublin monitoring dashboards
===
* Please log in the monitoring dashboards by clicking into `Dublin mon` tab.

<a href="#Dublin monitoring tab">
  <img alt="Dublin monitoring tab" src="../assets/img/dublin-mon-tab.png" />
</a>

<a href="#" class="lightbox" id="Dublin monitoring tab">
  <img alt="Dublin monitoring tab" src="../assets/img/dublin-mon-tab.png" />
</a>

* The Dublin monitoring dashboard is not available! After some fault-finding, the team realizes that they need to configure the edge firewalls for the new monitoring application.
We’ll configure this in the next challenge.

<a href="#Service not ready yet">
  <img alt="Service not ready yet" src="../assets/img/pleasewait.png" />
</a>

<a href="#" class="lightbox" id="Service not ready yet">
  <img alt="Service not ready yet" src="../assets/img/pleasewait.png" />
</a>

✅ Check the challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the tasks.

🐛 Encountered an issue?
====
If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=getting-started-edge-lab&title=Getting+started+with+Ansible+Automation+Platform+and+edge+issue:+incident-creation&assignees=dafmendo).

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
  img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 100%;
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