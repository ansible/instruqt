---
slug: snow-event-troubleshooting-copy
id: nrgwglqp1qjs
type: challenge
title: Event-Driven Ticket escalation and ChatOps
tabs:
- title: editor
  type: code
  hostname: ansiblerulebook
  path: /root/netops
- title: ansible_rulebook
  type: terminal
  hostname: ansiblerulebook
  workdir: /root/netops/
- title: cEOS 01 - Arista
  type: terminal
  hostname: podman-host
  cmd: podman exec -it ceos1 Cli
- title: 'cEOS 02 - Arista '
  type: terminal
  hostname: podman-host
  cmd: podman exec -it ceos2 Cli
- title: cEOS 03 - Arista
  type: terminal
  hostname: podman-host
  cmd: podman exec -it ceos3 Cli
- title: _chat_
  type: service
  hostname: podman-host
  path: /
  port: 8065
difficulty: basic
timelimit: 600
---

## Observation enrichment with events


Before we try this exercise, please make sure your chat environment has been configured - if you haven't configured it due to skipping ahead then please go back to challenge 2 and follow the details.



☑️ Setting the hooks
===
In the previous exercise we used incoming webhooks on the chat interface allowing us to communicate to the team on things taking place. This time we are going to reverse that, and have an outgoing webhook to trigger some Ansible using the `webhook source plugin` for Event-Driven Ansible.

Navigate to your `chat` tab, and click on the **GRID**. Select `System Console`. From here you will need to scroll down until you find `Developer` under the Environment stack. In this section you need to allow for local addresses, so please configure:
**Allow untrusted internal connections to: `ansiblerulebook`**

Click on `Save`.
This will allow communication to the rulebook container we are using.

Next, go back to your grid and navigate to `integration`, and select **`Outgoing Webhook`**.

Click on `Add Outgoing Webhook`

Configure the webhook with the following details:

    Title: Switching it up with EDA
    Content Type: application/json
    Channel: Town Square
    Trigger words: update-my-switches
    Callback URL: http://ansiblerulebook:5000/endpoint

Click on `Save`, and then click on `Done`.


Switch tabs to  `ansible_rulebook`
Once the webhook is saved and ready to go we can proceed with our rulebook. Create a new rulebook called `chat_input.yml`. The below rulebook listens for webhooks using the webhook source plugin, in addition to this we are using multiple requirements in our condition. We are listening to a payload that is coming from our **town-square chat room** and for a specific trigger word.

    ---
    - name: Listen for events on a webhook
      hosts: all
      sources:
        - ansible.eda.webhook:
            host: 0.0.0.0
            port: 5000

      rules:
        - name: Webhook Event from Mattermost
          condition: event.payload.channel_name  == "town-square" and event.payload.trigger_word == "update-my-switches"
          action:
            debug:
              msg: "Got the hook!"

Next, run this rulebook by issuing the following command:

    ansible-rulebook --rulebook chat_input.yml -i inventory.yaml --print-events

Next, go to the `chat` tab too trigger the webhook by typing: `update-my-switches` in the `Town Square` chat.

You will see the webhook payload come in, and you should see the debug message underneath it.

        'payload': {   'channel_id': 'smdj3d5go7y7txyi31cc4o8w3a',
                       'channel_name': 'town-square',
                       'file_ids': '',
                       'post_id': '93my6dcanprsjdjcmjwzciqx4w',
                       'team_domain': 'network',
                       'team_id': 'muk6bbh4hif73df1rraej9ejjo',
                       'text': 'update-my-switch',
                       'timestamp': 1683210948363,
                       'token': 'upfhzr93ht8k5jfoi5dhn48doe',
                       'trigger_word': 'update-my-switches',
                       'user_id': 'k7bmgukhsfbf8q7j6poxwprk5w',
                       'user_name': 'network-joe'}}
    Got the hook!

Type `Ctrl-C` to exit the rulebook.


☑️ Refining the hook
===

We need to add a bit more to this scenario. Edit the rulebook called `eda_backup_chat.yml`  Lets add the following condition.

    - name: backup ceos2
      condition: event.payload.text is search("ceos2")
      action:
       run_playbook:
         name: backup_ceos2.yml
         post_events: true

This introduces us to a new concept. The ability to use logic operators in our conditions. This condition `event.payload.text is search("ceos2")` is telling the rulebook that we need to search in the event object and try to get a partial match for `ceos2`. So should this object mention ceos2, we will get our match and the action would follow. We can add another rule:

    - name: backup all switches
      condition: event.payload.text is match("backup")
      action:
       run_playbook:
         name: backup_all.yml
         post_events: true

This condition is looking for an exact match in the object for `"backup"`. This needs to be a 100% exact match for the action to work.
Your rulebook should look like this:

    ---
    - name: Listen for events on a webhook
      hosts: all
      sources:
        - ansible.eda.webhook:
            host: 0.0.0.0
            port: 5000

      rules:

        - name: Update switch ceos2 from webhook
          condition: event.payload.text is search("ceos2")
          action:
           run_playbook:
            name: backup_ceos2.yml
            post_events: true

        - name: backup all switches
          condition: event.payload.text is match("backup")
          action:
           run_playbook:
            name: backup_all.yml
            post_events: true

The playbooks `backup_ceos2.yml` and `backup_all.yml` have been provided for you already. Feel free to have a look at them. Lets test this by editing the outgoing webhook you created earlier.

The webhook you created was listening for "`update-my-switches`". We should change that trigger phrase to "`backup`".
Navigate back to your ansiblerulebook tab and start the rulebook.

`ansible-rulebook --rulebook eda_backup_chat.yml -i inventory.yaml --print-events`

In your chat trigger a backup by typing: `backup` and then test backing up just `ceos2` by typing `backup ceos2`.

☑️ Bringing it together with ServiceNow
===

This last component brings observation to another level. With integrating into ServiceNow we are able to enrich tickets with the use of Event-Driven Ansible.

For this exercise you will need an instance of ServiceNow or a developer account.

> You are able to sign up for a development instance at
> https://developer.servicenow.com/ - Once you have signed up, you can
> request an instance, for example **San Diego**. Once its ready you
> will be presented with an Instance URL, a username and a password, as
> well as a handy link to open the instance.

Once you have gotten these details you are able to login to your instance.
For this exercise we will simply add these details as environment variables to the environment.
Go to the `ansible_rulebook` tab and enter the following commands but using the information from `YOUR NEWLY CREATED ServiceNow Instance`

    example:
    sh-4.4# export SN_USERNAME="admin"
    sh-4.4# export SN_HOST="https://dev141682.service-now.com/"
    sh-4.4# export SN_PASSWORD="*********"

Next, we are going to create a new rulebook called `eda_snow.yml`. Below are the conditions you should use. Build the rulebook based on one of our previous exercises.

       - name: backup all switches and upload to snow
         condition: event.payload.text is match("backup") and event.payload.text is search("snow")
         action:
          run_playbook:
           name: backup_all.yml
           post_events: true

       - name: log ticket with config files
         condition: event.backup_done == "complete"
         action:
          run_playbook:
           name: snow_incident.yml

This ruleset allows us to trigger backups of our switches and then post them to our ticketing system.


Next, We need to modify our `backup_all.yml` playbook so we can set facts that we can use to chain the rules like we did previously.

Add a task to archive the configuration files, so we can attach them to our ServiceNow ticket, and setup facts:

    - name: archive configuration files
       community.general.archive:
         path:  /tmp/backups
         dest:  /tmp/backups.tgz

    - set_fact:
         cacheable: true
         backup_done: "complete"
         channel_name: "{{ ansible_eda.event.payload.channel_name }}"
         trigger: "{{ ansible_eda.event.payload.trigger_word }}"



Next, We need to create a new playbook called `snow_incident.yml`


    ---
    - name: Creating Snow tickets
      hosts: localhost
      connection: local
      gather_facts: false
      collections:
        - servicenow.itsm

      vars:
       SN_HOST: "{{ lookup('env', 'SN_HOST') }}"
       SN_USERNAME: "{{ lookup('env', 'SN_USERNAME') }}"
       SN_PASSWORD: "{{ lookup('env', 'SN_PASSWORD') }}"

      tasks:

        - name: Create incident
          servicenow.itsm.incident:
            state: new
            caller: "{{ lookup('env', 'SN_USERNAME') }}"
            short_description: "Chat request logged from: {{ ansible_eda.event.channel_name }}, Trigger: {{ ansible_eda.event.trigger }}"
            description: "Network configurations have been backed up and uploaded"
            impact: high
            urgency: high
          delegate_to: localhost

Once you have your rulebook ready, start it up using the command below! - We should be creating tickets with information about which channel and what the trigger was when creating the incident.

    ansible-rulebook --rulebook eda_snow.yml -i inventory.yaml --print-events

From the chat:

    #Town_Square: backup snow

Once the action is completed, log into your ServiceNow instance and check that the INCIDENT was created!  Please look in `Service Desk -> Incidents`.

Well done!

This concludes this exercise

