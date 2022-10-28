---
slug: config-firewall
id: 0c5n3czzntyq
type: challenge
title: Configuring the edge firewall
teaser: We've installed the monitoring software, but we can't access it! We will configure
  the edge firewalls to access the WebUI.
notes:
- type: text
  contents: "# Third mission:  Dublin locations require access to reach the monitoring
    dashboards.\n##### The monitoring dashboards \U0001F4CA are deployed, however
    the traffic is restricted \U0001F6AB.\n##### In this challenge you will configure
    the firewall rules to allow ONLY the traffic required \U0001F50E✅.\n##### Click
    on Start button to solve this challenge using automation.\n<style type=\"text/css\"
    rel=\"stylesheet\">\nh1,h2{\n  text-align: center;\n}\np {\n  text-align: center;\n}\nimg
    {\n  display: block;\n  margin-left: auto;\n  margin-right: auto;\n  height: 60%;\n\n}\n</style>"
tabs:
- title: Controller
  type: service
  hostname: controller-edge-lab
  port: 443
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

### Third mission: Configure the firewall rules to allow the access to the monitoring dashboard into Dublin factory
In this challenge, we’ll review how to automate the firewall configuration for a single remote location using the corresponding instance group.

##### ⏰ Estimated time to complete: *10 minutes*

>**❗️ Note**
>
>* If required, log into automation controller using the provided credentials from the _Controller_ tab.
>* You can expand the images by clicking on them for a closer look.
>* Here’s the [link](https://github.com/craig-br/instruqt-track-content/blob/65e9c23585f22e0c725108c1277a4c524bf58513/getting-started-edge-lab/playbooks/configure_firewall.yml) to the playbook used in this example.

☑️ Task - Configure firewalls rules into a remote location
===

##### ✏️ Explore *Configure edge firewalls* job template in **automation controller**.

* On the side navigation under the **Resources** section, click on **Templates**.
* Click on the `Configure edge firewalls` dropdown arrow.

<a href="#config_fw_template">
  <img alt="Configure edge firewalls" src="../assets/img/config_fw_template.png" />
</a>

<a href="#" class="lightbox" id="config_fw_template">
  <img alt="Configure edge firewalls" src="../assets/img/config_fw_template.png" />
</a>

The `Configure edge firewalls` job template uses the  `Dublin region` inventory by default if no other inventory is specified at launch. The `dublin-edge-lab` execution node is associated with the `Dublin region` inventory and runs the job template.

<a href="#config_fw_template_dublin">
  <img alt="Configure edge firewalls inventory" src="../assets/img/config_fw_template_dublin.png" />
</a>

<a href="#" class="lightbox" id="config_fw_template_dublin">
  <img alt="Configure edge firewalls inventory" src="../assets/img/config_fw_template_dublin.png" />
</a>

##### ✏️ Launch *Configure edge firewalls* job template.

* On the side navigation under the **Resources** section, click on **Templates**.
* Click on the `Configure edge firewalls` <img src="https://github.com/IPvSean/pictures_for_github/blob/master/launch_job.png?raw=true" style="width:4%; display:inline-block; vertical-align: middle;" /> icon to launch the template.
* Keep the default `Dublin region` selected and click on `Next`.
<a href="#Configure edge firewalls template region prompt">
  <img alt="Configure edge firewalls template region prompt" src="../assets/img/config_fw_template_prompt.png" />
</a>

<a href="#" class="lightbox" id="Configure edge firewalls template region prompt">
  <img alt="Configure edge firewalls template region prompt" src="../assets/img/config_fw_template_prompt.png" />
</a>

* Click `Launch` to trigger the automation job.

<a href="#Launch Configure edge firewalls template">
  <img alt="Launch Configure edge firewalls template" src="../assets/img/config_fw_template_launch.png" />
</a>

<a href="#" class="lightbox" id="Launch Configure edge firewalls template">
  <img alt="Launch Configure edge firewalls template" src="../assets/img/config_fw_template_launch.png" />
</a>

>ℹ️ The `Configure edge firewalls` template will configure the firewall to allow the traffic to the monitoring application. Check the tasks executed under the **Views** section, inside **Jobs**.

<a href="#View Configure edge firewalls template job execution">
  <img alt="View Configure edge firewalls template job execution" src="../assets/img/config_fw_template_job.png" />
</a>

<a href="#" class="lightbox" id="View Configure edge firewalls template job execution">
  <img alt="View Configure edge firewalls template job execution" src="../assets/img/config_fw_template_job.png" />
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

* You will notice the Monitoring dashboards are available now. Login with the corresponding credentials.

<a href="#Monitoring dashboards">
  <img alt="Monitoring dashboards" src="../assets/img/mondash-user.png" />
</a>

<a href="#" class="lightbox" id="Monitoring dashboards">
  <img alt="Monitoring dashboards" src="../assets/img/mondash-user.png" />
</a>

* The monitoring dashboards will show RHEL statistics including traffic utilization.

<a href="#Monitoring dashboards KPIs">
  <img alt="Monitoring dashboards KPIs" src="../assets/img/mondash-traffic.png" />
</a>

<a href="#" class="lightbox" id="Monitoring dashboards KPIs">
  <img alt="Monitoring dashboards KPIs" src="../assets/img/mondash-traffic.png" />
</a>

✅ Go to the next challenge
===
Press the `Next` button below to go to the next challenge once you’ve completed the tasks.

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