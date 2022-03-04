---
slug: incident-creation
id: imhhndnintee
type: challenge
title: Incident creation
notes:
- type: text
  contents: The ServiceNow integration for Ansible Automation Platform is made possible
    through a certified content collection called `servicenow.itsm`.  This collection
    is made available on Automation Hub on `console.redhat.com`. The environment that
    is being created for you includes this collection in an execution environment
    that allows Ansible Automation Platform to execute tasks against a ServiceNow
    instance.
- type: text
  contents: |-
    Credentials in Automation Controller are encrypted on creation and allow for organizations to share access to additional services without revealing sensitive information. Once credential passwords are encrypted, there is no way to retrieve the value.

    Because of this, credentials are a good way to grant or revoke access to services at any time. As part of this environment, you have access to Automation Controller, and a user account on a ServiceNow instance with the credential already configured.
- type: text
  contents: |-
    This learning track demonstrates the core capabilities of this intergration. The creation of this environment usually takes about a minute to complete.

    If you happen to experience any issues with this learning track, please create a new issue on the Github page for this project: https://github.com/ansible/instruqt/issues
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
In ITIL, an incident refers to an unplanned outage or reduction in quality of an IT service or application. ServiceNow implements technology mapped to ITIL terminology and is accepted as an industry standard for incident management.

The servicenow.itsm certified collection allows organizations to leverage incident management within Ansible Automation Platform workflows.

A playbook as been created in the `VS Code` tab called `incident-create.yml`.
- Inspect this playbook and review the in-line comments to understand how the collection is being leveraged.
---

- Next, use the login credentials supplied in `readme.md` to access the Automation Controller tab.

- Navigate to `Resources > Templates` and press the rocket icon to launch the `Create incident (incident-create.yml)` job.
![launch job icon](../assets/launch-icon.png)
---

If the previous step completed successfully, you should see a new incident has been created. To verify that this is the case:
- Use the ServiceNow credentials from `readme.md` to access ServiceNow from the `ServiceNow` tab.

- In ServiceNow, click the star icon to access pre-configured favorites:
![servicenow screenshot](../assets/snow-star.png)

You should see a new Incident has been created! To verify this was done by you, your unique username for this environment should be shown in the Incident description. The incident number should also match the incident number displayed in the job execution output within Automation Controller.

Move onto the next section by selecting the green "Next" button below.