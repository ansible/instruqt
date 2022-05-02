---
slug: attach-problem
id: qipyytx3xglz
type: challenge
title: Attach a problem
teaser: Query existing incident number and attach a problem referencing incident
notes:
- type: text
  contents: |-
    **Did you know?**
    Ansible is written in YAML,  a text format that is easy to learn and allows for others to quickly understand what objectives automation tasks were created to accomplish just by reading the YAML files.
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
A problem represents the cause of one or more incidents. The root cause of the problem may not be known at the time of creation and may require root cause analysis through the problem management process.

Another playbook has been added to your working directory in VS Code and a template has been created to attach a problem to the incident previously created.

- First, inspect the playbook called `problem-attach.yml` in the `VS Code` tab.

> Notice that this playbook will first query for existing incident numbers that you have created and will use the value returned in the task that creates the problem.

- Next, execute the new job template from Automation Controller by pressing the rocket icon next to the template `2 - Attach problem (problem-attach.yml)`.

That should have completed successfully! Go back to ServiceNow and check under your assigned problems for a new problem number:

![new problem](../assets/new-problem.png)

You can also check to see if the status of the incident has been updated. There should now also be a problem referenced on the incident page.
