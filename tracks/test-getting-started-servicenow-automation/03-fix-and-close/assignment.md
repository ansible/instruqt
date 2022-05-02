---
slug: fix-and-close
id: uqqamri47d4n
type: challenge
title: Root cause, fix and close
teaser: Query previous created records and link a new change request record
notes:
- type: text
  contents: |-
    **Did you know?**
    Ansible playbooks and other ansible content types are typically stored in version control as plain text. This means that common approaches to continuous integration and continuous deployment are easily applied to automation content.
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
- Review the new playbook called `change-attach.yml` as before
- launch the job template `3 - Attach change request (change-attach.yml)` in Automation Controller
- Watch for job completion in Automation Controller

Going back to ServiceNow, select `Change - Open` under your favorites. This should list out all open change requests. You should see a new change request has been created with the title `"Reboot the webserver"`. Notice how other relevant fields (such as 'Description' and 'On hold reason') have been updated as well.

Lets assume that we're ready to resolve our issues and mark our created records closed. To clean things up, head to the next exercise!
