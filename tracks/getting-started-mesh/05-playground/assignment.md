---
slug: playground
id: mgywzlmyzv0e
type: challenge
title: Automation mesh playground
teaser: Test your mesh skills in this challenge!
notes:
- type: text
  contents: "# \U0001F680 Automation mesh playground\nThe last challenge is to recap
    what we've covered in this lab. You will configure the ACME Corp automation mesh
    using what we've learnt in the previous exercises. Alternatively, you can use
    the remaining time to explore!\n\n<style type=\"text/css\" rel=\"stylesheet\">\nh1,h2{\n
    \ text-align: center;\n}\np {\n  text-align: center;\n}\nimg {\n  display: block;\n
    \ margin-left: auto;\n  margin-right: auto;\n  width: 80%;\n}\n</style>"
tabs:
- title: Controller
  type: service
  hostname: raleigh-controller
  port: 443
difficulty: basic
timelimit: 300
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

#### ⏰ Estimated time to complete: 15 minutes

In this challenge, you’ll configure automation mesh. The playground offers less step-by-step guidance on how to complete the tasks.

There are no checks in this challenge, so if you prefer to explore the environment, please feel free to do so.

👍 Good luck!

>**❗️ Note**
>
>* Perform all tasks in the _Controller_ tab located at the top-left of your browser.
>* If required, log into the automation controller using the provided credentials.
>* You can expand the images by clicking on them for a closer look.
>* Task checks might take a few seconds longer in this challenge.
>* Feel free to run the `Mesh route info` job template during the exercises to see how automation mesh creates new peer connections.

☑️ Task - Lab scenario
===

<a href="#disconnected">
  <img alt="disconnected" src="../assets/img/disconnected.png" />
</a>

<a href="#" class="lightbox" id="disconnected">
  <img alt="disconnected" src="../assets/img/disconnected.png" />
</a>

The `jhb-exec` worker node, located in the Johannesburg remote office, is currently unreachable from the ACME Corp Raleigh data center. A secondary network link exists via the Dublin cloud region located in Ireland.

The ACME Corp IT team needs to run the `Debug info` job template to troubleshoot an issue in Johannesburg.

☑️ Task - Lab environment
===

ACME Corp has the following pre-created in automation controller.

##### Inventories and associated hosts:

* `Johannesburg DC`.
* `Raleigh DC`.
* `Dublin DC inventory`.

##### Automation mesh worker nodes:

* `raleigh-controller` is configured as a **hybrid** node in the Raleigh data center.
* `jhb-exec` is configured as an **execution** node in the Johannesburgremoyte office.
* `dublin-hop` is configured as a **hop** node in the Dublin public cloud region.

☑️ Task - Instance groups and inventories
===

##### ✏️ Create the necessary instance groups, associations and inventories.

* Create the `Raleigh data center` instance group and associate the `raleigh-controller` instance with the instance group.
* Configure the `Raleigh DC` inventory to use the `Raleigh data center` instance group.
* Create the `Johannesburg data center` instance group and associate the `jhb-exec` instance with the instance group.
* Configure the `Johannesburg DC` inventory to use the `Johannesburg data center` instance group.

☑️ Task - Configure dublin-hop node
===

##### ✏️ Run job templates to configure and test the Dublin hop node.

* Execute the `Setup Dublin hop node` job template to enable the `dublin-hop`node.
* Run the `Debug info` job template using the `Johannesburg DC` inventory

If the `Debug info` job template executes successfully, you’ve completed your mission!

**Congratulations on completing the lab!**

👏 Close the lab
===

Press the `Next` button to close the lab.

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