---
slug: kafka
id: ei1ltrgknh6y
type: challenge
title: 'Getting Started: Kafka Example'
teaser: Here we test ansible-rulebook with a Kafka source and monitor a topic for
  a message to respond to.
notes:
- type: text
  contents: |-
    Kafka allows us to have events in an event stream which we can subscribe to. This allows us a bigger possibilty and opens the door to monitoring applications or enterprise environments using event streams already.

    In this example we will subscribe to a stream and act on a specific message we pick up from the stream.
tabs:
- title: editor
  type: code
  hostname: ansible-rulebook
  path: /root
- title: ansible-rulebook
  type: terminal
  hostname: ansible-rulebook
- title: kafka
  type: terminal
  hostname: broker
difficulty: basic
timelimit: 600
---
☑️ Kafka Topic Source
===
In this example we are going to use Kafka messages in a topic and respond to a specific message.


- From the _editor_ tab, inspect the `kafka-example.yml` rulebook. Take note of the source plugin that we are using.

- See that the source is pointing to a kafka host called `broker` and topic called `eda-topic`

- The rule is looking for a message on that topic that matches the text "Ansible is cool"

- From the _ansible-rulebook_ tab, start `ansible-rulebook` against the kafka rulebook:



`ansible-rulebook --rulebook kafka-example.yml -i inventory.yml --print-events`

Now that we have `ansible-rulebook` listening, lets start up our Kafka messages

- From the _kafka_ tab, start the producer client which will allow you to send messages to the topic

- **Note:** this starts an interactive terminal client, copy in your message on the `>` prompt and hit enter to send



`kafka-console-producer --bootstrap-server broker:9092 --topic eda-topic`



- From the _kafka_ tab, send a message using the client started in the previous step. The following message should not trigger a response from `ansible-rulebook`:



`{"message":"Ansible is good"}`



- From the _ansible-rulebook_ tab, see that the message has been read from the topic



- From the _kafka_ tab, send a message using the running kafka client that will be a match for the conditions in the active rulebook:



`{"message":"Ansible is cool"}`



- From the _ansible-rulebook_ tab, see that the message has been read from the topic and the playbook has been executed



- Event data is automatically passed to the ansible playbook. Try sending another message specifying `sender`: with your name.



`{"message":"Ansible is cool", "sender":"YOUR NAME"}`

- You will notice in the say-what.yml playbook, we have specified the following: `ansible_eda.event`. This allows us to reference the event data from ansible-rulebook.
