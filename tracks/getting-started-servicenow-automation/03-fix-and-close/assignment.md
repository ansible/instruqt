---
slug: fix-and-close
id: ywwa9cznygjx
type: challenge
title: Root cause, fix and close
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
timelimit: 330
---
A change is anything added, removed, or modified to address a problem that may be related to a past or ongoing incident.

A new playbook has been created in your `VS Code` tab.
- Review the new playbook called `change-attach.yml` as before and then
- launch the new job template using the rocketship icon next to the 3rd job template in Automation Controller. Before the job executues, you'll notice another prompt to specify the value for `problem_number` - find this value in ServiceNow under `Problem - Assigned to me` in your user's configured favorites.
- Watch for job completion in Automation Controller

Going back to ServiceNow, select `Change - Open` under your favorites. This should list out all open change requests. You should see a new change request has been created with the title `"Reboot the webserver"`. Notice how other relevant fields (such as 'Description' and 'On hold reason') have been updated as well.

Finally, lets assume that our fictional board meeting that was holding up the reboot of the webserver has now completed and we can safely perform our change request and update the status of the problem and incident to indicate that everything has been resolved.
