---
slug: webhook-source
id: uxwueb4fjanz
type: challenge
title: 'Getting Started: Webhook Example'
teaser: Here we test ansible-rulebook with a Webhook source and respond to a trigger,
  and we look at some of the basics of Event-Driven Ansible rulebooks.
notes:
- type: text
  contents: We are going to test a webhook event in the following exercise as well
    as having a look at our very first rulebook!
- type: image
  url: ../assets/rulebook.png
tabs:
- title: editor
  type: code
  hostname: ansible-rulebook
  path: /root
- title: ansible-rulebook
  type: terminal
  hostname: ansible-rulebook
- title: terminal
  type: terminal
  hostname: ansible-rulebook
difficulty: basic
timelimit: 600
---

☑️  Rulebook basics
===

`ansible-rulebook` relies on a few components. These components all come together to allow you to respond to events and decide on the next course of action. The three main components to the rulebooks are as follows:

 - **Source** - The sources of our events come from source plugins. These plugins define where we are listening for events.
 - **Condition** - The conditional statements in the rulebook allow us to match criteria on which we want to have some kind of response to.
 - **Action** - Lastly, the action is our response once the condition has been met from the event source. This can be to trigger remediation, log a ticket for observation or generate other events which we would want to respond to.

Currently we have a number of source plugins however this list is being developed and as more partners get involved in the project the list will expand.

![Rulebook](../assets/rulebook.png)


|Source Plugin|  Description |
|--|--|
|  Azure Service Bus |  An ansible-rulebook event source module for receiving events from an Azure service bus|
|File|An ansible-rulebook event source plugin for loading facts from YAML files initially and when the file changes|
|Kafka|An ansible-rulebook event source plugin for receiving events via a kafka topic|
|Range|An ansible-rulebook event source plugin for generating events with an increasing index i|
|URL Check|An ansible-rulebook event source plugin that polls a set of URLs and sends events with their status|
|Webhook|An ansible-rulebook event source module for receiving events via a webhook|
|Watchdog|An ansible-rulebook event source plugin for watching file system changes|
|Alertmanager|An event source module for receiving events via a webhook from Alertmanager|


☑️ Webhook Source
===


- From the _editor_ tab, inspect sources and rules in `webhook-example.yml`

We can see in this example the components we mentioned above:

This indicated which source plugin we are using, and in this example its the webhook plugin:

    sources:
    	- ansible.eda.webhook:
    		host: 0.0.0.0
    		port: 5000

The rule we are using which provides a conditional is specified, and in this example is looking for a message:

    rules:
    	- name: Say Hello
    	  condition: event.payload.message == "Ansible is super cool!"



Lastly in our rulebook we have an action, so should the rule condition be met then the action will trigger.

    action:
      run_playbook:
        name: say-what.yml


Now,  lets look at the playbook that will get triggered should the condition in the rule be met.




- From the _editor_ tab, inspect the `say-what.yml` playbook

Lets try this out now,



- Run `ansible-rulebook` against that rulebook from the `ansible-rulebook` tab:



`ansible-rulebook --rulebook webhook-example.yml -i inventory.yml --print-events`



- Notice the initial rulebook being loaded by `ansible-rulebook` in the output followed by a flashing cursor


 Lets go a head and try trigger some messages and responses

- From the `terminal` tab, use `curl` to post a message to the endpoint created by `ansible-rulebook`:


`curl -H 'Content-Type: application/json' -d "{\"message\": \"Ansible is alright\"}" 127.0.0.1:5000/endpoint`



- From the `ansible-rulebook` tab, see that that message was recieved but it didn't match the rule so nothing was done



- From the `terminal` tab, use `curl` to post a message that matches the condition:



`curl -H 'Content-Type: application/json' -d "{\"message\": \"Ansible is super cool\"}" 127.0.0.1:5000/endpoint`
