---
slug: servicenow-inventory
id: o76tridi2fwy
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
difficulty: basic
timelimit: 400
---
Up to this point, we've explored some of the modules from `servicenow.itsm` that we can leverage as a part of an automated incident management process. The interaction we've had while exporing these modules probably isn't how we would implement these modules in production.

Rather, we'd probably use these playbooks as a part of an Automation Controller workflow where we can drag and drop incident creation, updates, resolution, etc. in an entire change management/problem resolution workflow.

Apart from ITSM tasks, `servicenow.itsm` collection also has a really useful inventory script.

A new inventory has been added to Automation Controller, but it hasn't synced any hosts yet. Take a look!

---

- First, open the Automation Controller tab and navigator the right hand navigation pane to `Hosts`. Notice that this list is empty. This is because the integration between Ansible Automation Platform and ServiceNow is an API to API integration where the endpoints we're targetting are not individual hosts, but an API.

- Next, using the left hand side navigation pane, select `Inventories`. What's new here is the `ServiceNow inventory` - click on it. Now, select the `Sources` tab and the `Sync all` button.

This just kicked of a series of jobs to update the inventory we're pulling out of ServiceNow CMDB!
- Select `Jobs` from the left hand navigation pane and you'll be able to monitor the progress of this update.
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

All finished!