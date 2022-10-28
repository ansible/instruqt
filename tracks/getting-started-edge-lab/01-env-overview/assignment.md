---
slug: env-overview
id: cw0l0swiz1du
type: challenge
title: Environment overview
teaser: In this challenge, we'll review the ACME Corp environment.
notes:
- type: text
  contents: "# ACME Corp. Dublin and Johannesburg plants\n##### An industrial site
    is a complex ecosystem, your Plant Manager has tasked you to monitor \U0001F50E\U0001F4CA
    and improve the production line and packaging \U0001F6E0\U0001F4C8. To achieve
    that, ACME will deploy an application to ruggedized servers with HMI (Human Machine
    Interface) displays connected to them.\n##### To the average user this will look
    like  a tablet device \U0001F4F2 with an application running in kiosk mode (surprise!
    its RHEL running under the covers).\n##### Dependencies such as: IPAM, DNS configuration,
    networking connectivity, patches and hardening must be solved in parallel or as
    day 2 operations post deployment.\n\n<style type=\"text/css\" rel=\"stylesheet\">\nh1,h2{\n
    \ text-align: center;\n}\np {\n  text-align: center;\n}\nimg {\n  display: block;\n
    \ margin-left: auto;\n  margin-right: auto;\n  height: 60%;\n\n}\n</style>"
- type: text
  contents: "##### By automating the deployment of the containerized application and
    all its dependencies using **Ansible Automation Platform**. \U0001F3C5\U0001F3C5\U0001F3C5\n
    <center><img src=\"https://github.com/dafmendo/pictures_for_github/blob/fd9d1c424a130fbe4de73730b24d2a8c1d85e4bb/industrialapp-deploy-mesh.png?raw=true\"></center>\n
    Click on the Start button to begin this adventure!\n\n<style type=\"text/css\"
    rel=\"stylesheet\">\nh1,h2{\n  text-align: center;\n}\np {\n  text-align: center;\n}\nimg
    {\n  display: block;\n  margin-left: auto;\n  margin-right: auto;\n  height: 60%;\n\n}\n</style>"
tabs:
- title: Controller
  type: service
  hostname: controller-edge-lab
  port: 443
difficulty: basic
timelimit: 600
---

🔐 Login credentials for the mission
===

>**Controller username**:
> ```yaml
>student
>```
>**Controller password**:
>```yaml
>learn_ansible
>```

👋 Introduction
===
### ACME Corp
ACME Corp uses Ansible Automation Platform extensively to manage their edge ecosystem across multiple regions.
In this challenge, we’ll review their installation, learn more about mesh worker node types and explore controller instances and instance groups.

##### ⏰ Estimated time to complete: *10 minutes*

>**❗️ Note**
>
>* Perform all tasks in the _Controller_ tab located at the top-left of your browser.
>* If required, log into automation controller using the provided credentials.
>* You can expand the images by clicking on them for a closer look.

☑️ First task - ACME Corp automation mesh overview
===

<a href="#mesh_nodes">
  <img alt="Controller login" src="../assets/img/mesh_nodes.png" />
</a>

<a href="#" class="lightbox" id="mesh_nodes">
  <img alt="Amesh_nodes" src="../assets/img/mesh_nodes.png" />
</a>

>ℹ️ Automation mesh creates a network overlay using TLS connections, it is established across different worker node types you can use for [control plane](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.1/html-single/red_hat_ansible_automation_platform_automation_mesh_guide/index#control_plane) and [execution plane](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.1/html-single/red_hat_ansible_automation_platform_automation_mesh_guide/index#execution_plane) tasks.
>* **Hybrid nodes** run control plane tasks, such as management jobs, and can execute automation.
>* **Execution nodes** only execute automation ( running playbooks ) and don’t run automation controller runtime functions, such as project updates.

##### ACME Corp’s automation mesh configuration and worker node types.

* `controller-edge-lab` - Located in the Raleigh headquarters and configured as a *hybrid node*.

* `jhb-edge-lab` - Located in the Johannesburg remote chemical plant and configured as an *execution node*.

* `dublin-edge-lab` - Located in an Irish remote chemical plant and configured as a *execution node*.

>**❗️ Note**\
>Automation mesh also provides: **control** node type which only runs controller runtime tasks, and **hop nodes** which, *like jump hosts*, don’t run any execution or control plane tasks and only route traffic to other execution nodes. These nodes aren’t used in this lab.

☑️ Second task - Controller instances and instance groups overview
===

>ℹ️ [Instance groups](https://docs.ansible.com/automation-controller/latest/html/userguide/instance_groups.html) let you logically group mesh worker nodes, or instances, together and apply policies to determine how they behave.

##### ✏️ Explore automation controller instance groups.

* On the side navigation under the **Administration** section, click on **Instance Groups**.
* Click on the `default` instance group.
* Click on the **Instances** tab on the top. The `default` instance group is the default location for all mesh worker nodes and is always present in automation controller. It's used to execute *Job Templates* if no instance group is specified in their configuration.

<a href="#default_ig">
  <img alt="Default IG" src="../assets/img/default_ig.png" />
</a>

<a href="#" class="lightbox" id="default_ig">
  <img alt="Defaul IG" src="../assets/img/default_ig.png" />
</a>


* Click on the `jhb-edge-lab` instance and look at the *Node Type*. `jhb-edge-lab` is configured as an *execution node*.

<a href="#jhb-exec">
  <img alt="JHB Exec node" src="../assets/img/jhb_exec_node.png" />
</a>

<a href="#" class="lightbox" id="jhb-exec">
  <img alt="ACME mesh" src="../assets/img/jhb_exec_node.png" />
</a>

* Click on **Instance Groups** under the **Administration** section to return to the main instance group window.
* Click on the `controlplane` instance group.
* Click on the **Instances** tab on the top.

<a href="#control_ig">
  <img alt="Control IG" src="../assets/img/control_ig.png" />
</a>

<a href="#" class="lightbox" id="control_ig">
  <img alt="Control IG" src="../assets/img/control_ig.png" />
</a>

>ℹ️ The `controlplane` instance group is the preselected instance group for all mesh worker nodes that run [control plane](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.1/html-single/red_hat_ansible_automation_platform_automation_mesh_guide/index#control_plane) tasks.

* Click on the `controller-edge-lab` instance and look at the *Node Type*. `controller-edge-lab` is configured as a *hybrid node*.

<a href="#hybrid_node">
  <img alt="Control IG" src="../assets/img/hybrid_node.png" />
</a>

<a href="#" class="lightbox" id="hybrid_node">
  <img alt="Control IG" src="../assets/img/hybrid_node.png" />
</a>

##### ✏️ Let’s view the ACME Corp inventories

* In the **Resources** menu on the left navigation bar, click **Inventories**. And you will see three regions: *Raleigh DC* headquarters, *Dublin region* and *Johannesburg region* which correspond to the two plants located in Europe and Africa.

<a href="#inventories_regions">
  <img alt="inventories_regions" src="../assets/img/inventories_regions.png" />
</a>

<a href="#" class="lightbox" id="inventories_regions">
  <img alt="inventories_regions" src="../assets/img/inventories_regions.png" />
</a>

* Click on *Dublin region* and notice the `Instance Groups` value, which is assigned to the `Dublin instance group`.

<a href="#inventories_dublinregion_instancegroup">
  <img alt="inventories_dublinregion_instancegroup" src="../assets/img/inventories_dublinregion_instancegroup.png" />
</a>

<a href="#" class="lightbox" id="inventories_dublinregion_instancegroup">
  <img alt="inventories_dublinregion_instancegroup" src="../assets/img/inventories_dublinregion_instancegroup.png" />
</a>

* Move back to the **Resources** menu on the left navigation bar, and click **Inventories**. You will be back again in the **Inventories** list.
* Click on *Johannesburg region* and notice the `Instance Groups` value, which is assigned to the `Johannessburg instance group`.

<a href="#inventories_jhbregion_instancegroup">
  <img alt="inventories_jhbregion_instancegroup" src="../assets/img/inventories_jhbregion_instancegroup.png" />
</a>

<a href="#" class="lightbox" id="inventories_jhbregion_instancegroup">
  <img alt="inventories_jhbregion_instancegroup" src="../assets/img/inventories_jhbregion_instancegroup.png" />
</a>

* Move back to the **Resources** menu on the left navigation bar, and click **Inventories**. You will be back again in the **Inventories** list.
* Click on *Raleigh DC* and notice the `Instance Groups` value, which is assigned to the `Raleigh data center` instance group.

☑️ Final task - Using topology viewer
===
>ℹ️ [Topology viewer](https://docs.ansible.com/automation-controller/latest/html/administration/topology_viewer.html) is a visual, interactive dashboard for automation mesh. It provides a view of node types, health,  and details in your mesh topology.

##### ✏️ Let’s view the ACME Corp mesh design in topology viewer.

* In the **Administration** menu on the left navigation bar, click **Topology View**.

<a href="#topology_viewer">
  <img alt="topology_viewer" src="../assets/img/topology_viewer.png" />
</a>

<a href="#" class="lightbox" id="topology_viewer">
  <img alt="topology_viewer" src="../assets/img/topology_viewer.png" />
</a>

* Click on the `jhb-edge-lab` node in the diagram. You can view your instances' health and mesh node type in the top right-hand corner. You can also drill down into the node configuration by clicking on the instance name.

<a href="#jhb_exec_topology">
  <img alt="jhb_exec_topology" src="../assets/img/jhb_exec_topology.png" />
</a>

<a href="#" class="lightbox" id="jhb_exec_topology">
  <img alt="jhb_exec_topology" src="../assets/img/jhb_exec_topology.png" />
</a>

✅ Next Challenge
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

