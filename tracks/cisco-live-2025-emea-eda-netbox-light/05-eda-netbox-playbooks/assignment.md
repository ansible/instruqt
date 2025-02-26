---
slug: eda-netbox-playbooks
id: 5vqovndcvwxw
type: challenge
title: 5 - Event-Driven Ansible Playbooks
teaser: Looking at the Job templates we will run as part of the EDA action
notes:
- type: text
  contents: "# Event-Driven Ansible & Playbooks\n\nIn this exercise we will check
    2 pre-created Job Templates that we will use as part of our Event-Driven Ansible
    actions.\nThe Job Templates are the usual ones found in Automation controller,
    bue we are going to use them later in our Ansible Rulebook as the `action` condition.\n\n\U0001F539
    Key EDA Components:\n✅ Event Source – Detects changes (e.g., NetBox updates).\n✅
    Rulebook – Defines conditions & actions.\n✅ Job Template – Specifies the automation
    workflow.\n"
tabs:
- id: ofikwiqi80nm
  title: AAP
  type: service
  hostname: control
  port: 443
- id: hrkedwthsbfj
  title: netbox web
  type: service
  hostname: netbox
  path: /
  port: 8000
- id: 3vlaxoxt76fq
  title: VSCode
  type: service
  hostname: devtools
  path: /editor/?folder=/home/rhel/aap_workshop/
  port: 80
- id: lyodegn2kjxo
  title: Terminal
  type: terminal
  hostname: devtools
  cmd: su - rhel
- id: psitnquymn04
  title: AAP Terminal
  type: terminal
  hostname: control
  cmd: bash
difficulty: ""
timelimit: 0
enhanced_loading: null
---
5 - Event-Driven Ansible Playbooks
===

In this exercise we will check 2 pre-created Job Templates that we will use as part of our Event-Driven Ansible actions.
Note how the `name` of each of them matches the one specified in `run_job_template` in our `netbox-webhooks.yml` Rulebook.

> [!IMPORTANT]
> The Job Templates to run in a Rulebook action are defined by their name. Make sure they are unique and always match!

Click In the **Automation Execution** section, and then in  **Templates** to bein exploring them.

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

☑️ Task 1 - Configure NTP Servers Job Template
===

1. You will find a pre-created Job Template called `Configure NTP Servers `
2. This Job Template will run when EDA "listens" to an update of the NTP servers configuration from Netbox

☑️ Task 2 - Configure Login Banner
===

1. You will find a pre-created Job Template called `Configure Login Banner `
2. This Job Template will run when EDA "listens" to an update of the Login Banner from Netbox


✅ Next Challenge
===

Press the `Next` button below to go to the next challenge.

🐛 Troubleshooting
===

> [!WARNING]
>  - For the Job Templates to be pre-created in the exercise **5 - Event Driven Ansible Playbooks**, the `NetBox Dynamic Inventory` should exist.
> - If the inventory doesn't exist, first go to the corresponding exercise and create it, then run in the `AAP terminal`:
> ```
> su - rhel -c 'cd /home/rhel; ansible-navigator run /home/rhel/5-eda-playbooks.yml --mode stdout --penv _SANDBOX_ID'
> ```

> [!WARNING]
>  - For the Dynamic Inventory to work we need some NetBox pre-loaded content.
> - If you can't see devices in the NetBox tab, run the following commands:
> ```
> su - rhel -c 'cd /home/rhel/netbox-setup; ansible-navigator run /home/rhel/netbox-setup/netbox-setup.yml --mode stdout --penv _SANDBOX_ID'
> ```

> [!WARNING]
>  - NetBox needs a couple of minutes to get started.
> - If you can't see the NetBox login screen, go to the `netbox term` tab and run the following commands:
> ```
> docker compose --project-directory=/tmp/netbox-docker stop`
> ```
> ```
> docker compose --project-directory=/tmp/netbox-docker up -d netbox netbox-worker`
> ```



