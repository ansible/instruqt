---
slug: eda-controller-intro
id: 2bch0ksq1nul
type: challenge
title: '3 - Event-Driven Ansible: Automation Decisions'
teaser: Learn about EDA Controller and some of it's components!
notes:
- type: text
  contents: |-
    ## Event-Driven Ansible: Automation Decisions

    Event-Driven Ansible allows you to rip out more pages of your hardcopy runbook. While `Automation Controller` (through `Playbooks`) may automate your response to particular events, Event-Driven Ansible (through `Rulebooks`) codifies the symptoms that you have to recognize from an event before being able to respond. If you're able to describe the conditions for action and specify the response to those conditions, you're automation will become more resilient and allow your organization to respond with automation much quicker.

    With Ansible Automation Platform 2.5, components of the platform are co-located under a new unified user experience. Now you will find the Automation Decisions (EDA) user interface in the same screen as Automation Execution (Controller).
tabs:
- id: amdydtlztlxq
  title: AAP
  type: service
  hostname: control
  port: 443
- id: voteatr5ls6f
  title: netbox web
  type: service
  hostname: netbox
  path: /
  port: 8000
- id: v980cqohyjh5
  title: VSCode
  type: service
  hostname: devtools
  path: /editor/?folder=/home/rhel/aap_workshop/
  port: 80
- id: hwdcuurhllwj
  title: Terminal-1
  type: terminal
  hostname: devtools
  cmd: su - rhel
difficulty: ""
timelimit: 0
enhanced_loading: null
---
3 - Event-Driven Ansible: Automation Decisions
==

## Automation Decisions

Event-Driven Ansible allows you to rip out more pages of your hardcopy runbook. While `Automation Controller` (through `Playbooks`) may automate your response to particular events, Event-Driven Ansible (through `Rulebooks`) codifies the symptoms that you have to recognize from an event before being able to respond. If you're able to describe the conditions for action and specify the response to those conditions, you're automation will become more resilient and allow your organization to respond with automation much quicker.

With Ansible Automation Platform 2.5, components of the platform are co-located under a new unified user experience.

If you are not in the AAP tab, switch to the [button label="AAP"](tab-0) tab, and login.

🔑 Your credentials for the lab
===
> [!NOTE]
> AAP credentials:
> - Username: admin
> - Passowrd: ansible123!

> [!NOTE]
> NetBox credentials:
> - Username: admin
> - Passowrd: netbox

🎛️ EDA Controller resources
===

Just like `Automation Controller` has resources needed for job template execution, `Event-Driven Ansible Controller` defines resources needed for execution of rulebooks.
There are three main resource types that have to be defined before creating a rulebook activation that will listen for incoming events.

![automation decisions](../assets/automation_decisions.png)

🏞️ Decision Environments
===

If you're already familiar with Ansible **Execution Environments**, you will find **Decision Environments** very similar.

The main differences between the two are that **Execution Environments** (EEs) are built to contain tools to execute *Playbooks*, whereas **Decision Environments** (EEs) contain tools to execute *Rulebooks*. Both are container images that contain all the resources needed to execute Ansible playbooks and rulebooks, including the required collections.

Decision Environments are also built with collections that contain the `source plugins` for any source you want to receive events from. This means that if you'd like to receive events from `Dynatrace`, for example, you would have to install the collection `dynatrace.event_driven_ansible` in order to leverage the source plugin for `Dynatrace`.

Take a look at the `Decision Environments` tab under **Automation Decisions** on the left-hand sidebar menu in AAP.

You'll notice that there is already a **Decision Environment** added to AAP called `Default Decision Environment`. This was added at installation time and is distributed by Red Hat as `de-supported`. There is also another **Decision Environment** called `NetOps Decision Environment` which was created for this workshop and is a custom built. These Decision Environment contains the collection `ansible.eda` which ships *supported plugins* for several event sources.

![eda controller de](../assets/eda_controller_de.png)

🔑 Credentials
===

Credentials can be leveraged for pull operations for both Decision Environments and Projects, used to connect to external event sources and to secure inbound webhook endpoints via Event Streams. If you have private repositories for either Decision Environments or Projects, you can create a credential from **Automation Decisions > Infrastructure > Credentials** on the left-hand side of the **AAP** tab. By default, a `Decision Environment Container Registry` credential is added at installation time. There is also another credential called `AAP` which was pre-loaded into the AAP instance for this workshop. This credential will be used at the for **Rulebook Activations** in upcoming exercises.

![eda controller credentials](../assets/eda_controller_credentials.png)

📑 Projects
===

Projects are really just like they are on `Automation Controller` (under the `Automation Execution` heading). These projects represent source control repositories that contain your *rulebooks*.

![eda controller project](../assets/eda_controller_project.png)

✅ Next Challenge
===
Press the `Next` button below to go to the next challenge once you’ve completed the task.
