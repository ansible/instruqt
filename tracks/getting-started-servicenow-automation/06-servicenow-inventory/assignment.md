---
slug: servicenow-inventory
id: vyoxhzmu9zr5
type: challenge
title: Use ServiceNow as an inventory source
teaser: Perform advanced queries against your CMDB and act on the results
notes:
- type: text
  contents: |-
    **Did you know?**
    Ansible is agentless and only requires an SSH service running on the target machines. In these challenges however, the targets are APIs that allow Ansible to interact with external services like ServiceNow.
tabs:
- title: VS Code
  type: service
  hostname: controller
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel%2Fservicenow_project
  port: 443
- title: Automation Controller
  type: service
  hostname: controller
  port: 443
- title: ServiceNow
  type: website
  hostname: controller
  url: https://ansible.service-now.com
  new_window: true
difficulty: ""
timelimit: 420
---
👋 Introduction
====
Up to this point, we've explored some of the modules from `servicenow.itsm` that we can leverage as a part of an automated incident management process. While the interaction we've had while exploring these modules probably isn't how we would implement these modules in production, the modules contained in this collection are very flexible and can be applied to many different use cases within ITSM.

Apart from ITSM tasks, `servicenow.itsm` collection also has a really useful inventory script which allows you to query endpoints from the CMDB.

A new inventory has been added to Automation Controller, but it hasn't queried any hosts yet. Take a look!

👀 Review inventories
====
- First, open the Automation Controller tab and navigator the right hand navigation pane to `Hosts`. Notice that this list is empty. This is because the integration between Ansible Automation Platform and ServiceNow is an API to API integration where the endpoints we're targeting are not individual hosts, but an API.

▶️ Sync ServiceNow inventory
====
- Next, using the left hand side navigation pane, select `Inventories`. What's new here is the `ServiceNow inventory` - click on it. Now, select the `Sources` tab and the `Sync` 🔄 button.

This just kicked of a series of jobs to update the inventory we're pulling out of ServiceNow CMDB!
- Select `Jobs` from the left hand navigation pane and you'll be able to monitor the progress of this update.

🔍 Inspect results
====
- Once the two jobs have finished, click `Hosts` on the left hand navigation and notice all of the hosts pulled from CMDB.
- Also, explore the hosts and groups in Inventories > ServiceNow inventory > Hosts

This inventory can be carved up in many different ways. The inventory query provided for this inventory is shown below.
```
# Group hosts automatically, according to values of manufacturer and os columns.
# Include only records with the specified operating systems.
# Groups will most likely overlap.
plugin: servicenow.itsm.now
group_by:
  manufacturer:
  os:
    includes:
      - Linux Red Hat
      - Windows XP
```
> The above inventory is querying the CMDB for Linux and Windows XP operating systems and grouping the restults by manufacturer.

🎉 All finished! 🎉

🐛 Encountered an issue?
====
If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=getting-started-servicenow-automation&title=New+servicenow+issue:+servicenow-inventory+(Sandbox+id:+[[ Instruqt-Var key="SANDBOX" hostname="controller" ]])&assignees=cloin).