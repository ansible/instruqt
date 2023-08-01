---
slug: bgp-event-troubleshooting
id: w2aueofbwkpp
type: challenge
title: Event-Driven Troubleshooting
tabs:
- title: system
  type: terminal
  hostname: podman-host
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
## Chatting up a storm


Before we try this exercise, we need to configure our company Chat platform. Chat is a great way to get notifications and feedback from events in your environment.


>### **❗️ Chat Setup**
Navigate to _chat_, click on view in browser and fill in the desired details:

    email: networks@acme-corp.com
    Username: Network-Joe
    Password: ansible123!

Click on `Create a Team`  and Create a new team `Corp-Network` and complete the setup `Next, Next` , and click `Finish`.

Next, we need to configure a webhook api token. In the chat, click on the top left hand grid and select `integrations`. This should take you to a page to configure incoming webhooks. You can also get to integrations via the system console.

Select `Incoming Webhooks`  and then click `Add Incoming Webhook`. Give it a title `EDA Notification` and select the `#Town Square` channel, and then click on `Save`.  You will get a url like the following, however the api key is the part in bold typically following `/hooks/`:

*https://podman-host-some-url/hooks/* **upphz41ks3f9fcniygzmbads5w**


>### **❗️ Note**
>Keep that api key as you will need it later in this exercise.

Select `Done`.


☑️ Let us break something
===
In the previous exercise we basically listened for a port status change. This allowed us to remediate the port as well as configure it when another state was achieved.

Now, we are going to customize the events we want from the network telemetry and from there we can modify our current rulebook to listen for the new event and process it.

As mentioned before, we are using gNMIc to gather telemetry data from our network switches. This is all done via subscriptions. In this exercise we are going to subscribe to the BGP neighbor states so we can be made aware of possible changes to our neighbor switches.

Navigate to the `System` tab. This system has all the clients and services needed. Let's check if we can connect and gather the desired information. The below command tells the gNMI client to login to one of our switches and grab the nieghbor BGP status.

    gnmic -a localhost:6031 -u ansible -p ansible --insecure subscribe --path /network-instances/network-instance/protocols/protocol/bgp/neighbors/neighbor/state/session-state

You should get the states of the other two switches which are all connected:
We can see the established state

    {
      "source": "localhost:6031",
      "subscription-name": "default-1682707774",
      "timestamp": 1682705947403973020,
      "time": "2023-04-28T18:19:07.40397302Z",
      "updates": [
        {
          "Path": "network-instances/network-instance[name=default]/protocols/protocol[name=BGP][identifier=BGP]/bgp/neighbors/neighbor[neighbor-address=10.0.0.1]/state/session-state",
          "values": {
            "network-instances/network-instance/protocols/protocol/bgp/neighbors/neighbor/state/session-state": "ESTABLISHED"
          }
        }
      ]
    }
    {
      "source": "localhost:6031",
      "subscription-name": "default-1682707774",
      "timestamp": 1682705945620760480,
      "time": "2023-04-28T18:19:05.62076048Z",
      "updates": [
        {
          "Path": "network-instances/network-instance[name=default]/protocols/protocol[identifier=BGP][name=BGP]/bgp/neighbors/neighbor[neighbor-address=10.0.0.4]/state/session-state",
          "values": {
            "network-instances/network-instance/protocols/protocol/bgp/neighbors/neighbor/state/session-state": "ESTABLISHED"
          }
        }
      ]
    }

We can check on the switch `cEOS 01` what the current status is:

    ceos1(config)# show ip bgp summary vrf all
    BGP summary information for VRF default
    Router identifier 1.1.1.1, local AS number 65001
    Neighbor Status Codes: m - Under maintenance
      Neighbor         V  AS           MsgRcvd   MsgSent  InQ OutQ  Up/Down State   PfxRcd PfxAcc
      10.0.0.1         4  65002             26        36    0    0 00:18:04 Estab   4      4
      10.0.0.4         4  65003             38        41    0    0 00:00:07 Estab   4      4

We can see that we have established links. Now, let's simulate a basic issue. If you navigate to `cEOS 03` and login. We can disable the ethernet 3 port.

    ceos3> en
    ceos3# conf t
    ceos3(config)# int eth 3
    ceos3(config-if-Et3)# shut
    ceos3(config-if-Et3)#

If we go back to `cEOS 01` and check, we will see an issue:
You can see that neighbor 10.0.0.4 is reporting `NoIf` or `idle`.


    ceos1(config)# show ip bgp summary vrf all
    BGP summary information for VRF default
    Router identifier 1.1.1.1, local AS number 65001
    Neighbor Status Codes: m - Under maintenance
      Neighbor         V  AS           MsgRcvd   MsgSent  InQ OutQ  Up/Down State   PfxRcd PfxAcc
      10.0.0.1         4  65002             29        41    0    0 00:21:53 Estab   4      4
      10.0.0.4         4  65003             41        45    0    0 00:00:48 Idle(NoIf)


We can now configure Telegraf to subscribe to the BGP status and then use  this telemetry in our rulebook. From the `System` tab, edit the `/etc/telegraf/telegraf.conf` file by adding the following in the Switch 1 configuration block (`Ctrl-C`) to get to the prompt so you can update the `/etc/telegraf/telegraf.conf` file.


    [[inputs.gnmi.subscription]]
          ## Name of the measurement that will be emitted
          name = "bgp_neighbor_state_ceos1"
          origin = "openconfig"
          path = "/network-instances/network-instance/protocols/protocol/bgp/neighbors/neighbor/state/session-state"
          subscription_mode = "on_change"
          sample_interval = "1s"

Save your changes and restart telegraf with

    systemctl restart telegraf

We can now modify the current rulebook. We want to add a rule to look for the BGP changes. But first, lets restore the configuration on switch `cEOS 03` and bring the interface back up.

    ceos3(config-if-Et3)#no shut
    ceos3(config-if-Et3)#


☑️ Building the rules
===

Before we start confirm that your BGP and network configuration are in a good state. Run the following on `cEOS 01` and make sure your links are established.

    show ip bgp summary vrf all

Lets go to the `ansible_rulebook` tab and run the rulebook as it is. We will want to simulate the issue again but with the rulebook running so we can see the event payload which will help us build our rules.

    ansible-rulebook --rulebook port_status.yml -i inventory.yaml --print-events
Navigate back to `cEOS 03` and disable Ethernet port 3 again.

    ceos3(config-if-Et3)# shut
    ceos3(config-if-Et3)#

We should see this event on the `ansible_rulebook` tab:

    {   'fields': {'session_state': 'IDLE'},
        'meta': {   'received_at': '2023-04-29T16:30:17.551564Z',
                    'source': {   'name': 'ansible.eda.kafka',
                                  'type': 'ansible.eda.kafka'},
                    'uuid': '4fd51bf7-b1cd-467d-9356-730e5f017a4b'},
        'name': 'ceos1',
        'tags': {   '/network-instances/network-instance/protocols/protocol/name': 'BGP',
                    'host': 'podman-host',
                    'identifier': 'BGP',
                    'name': 'default',
                    'neighbor_address': '10.0.0.4',
                    'source': 'localhost'},
        'timestamp': 1682785815}

We will build a rule to match `{ 'fields': {'session_state': 'IDLE'},` as a condition. Stop `ansible_rulebook` (Ctrl-c) and edit the rulebook `port_status.yml`.

Add the following rule to your rulebook:

       - name: BGP change detected
         condition: event.fields.session_state == "IDLE"
         action:
           debug:
            msg: BGP CHANGE DETECTED!!

Once done, save your rulebook and start it up.
`    ansible-rulebook --rulebook port_status.yml -i inventory.yaml --print-events`

We can navigate to `cEOS 03` and shut down ethernet 3 to simulate a fault.

	`ceos3(config-if-Et3)# shut`

If you had recently done a `shut`, you many need to do `no shut` first followed by `shut`

We should see ansible-rulebook respond in the following fashion:

    sh-4.4# ansible-rulebook --rulebook port_status.yml -i inventory.yaml --print-events
    {   'fields': {'session_state': 'IDLE'},
        'meta': {   'received_at': '2023-04-30T17:45:23.484626Z',
                    'source': {   'name': 'ansible.eda.kafka',
                                  'type': 'ansible.eda.kafka'},
                    'uuid': '23acfd1f-be70-45ec-ac03-2d7c6b43e451'},
        'name': 'ceos1',
        'tags': {   '/network-instances/network-instance/protocols/protocol/name': 'BGP',
                    'host': 'podman-host',
                    'identifier': 'BGP',
                    'name': 'default',
                    'neighbor_address': '10.0.0.4',
                    'source': 'localhost'},
        'timestamp': 1682876720}
    BGP CHANGE DETECTED!!

We have matched the condition, and our action to display a debug message has taken place.

Great! So let's build a playbook to use for observation. At the beginning of this challenge there were some instructions on how to setup your chat environment. You will need those details now.  **You will need the API key added to the playbook you are about to create!**

We can now create a playbook that will allow us to take details form the BGP event that we are listening to and ultimately push a notification to our corperate networking/technical support channel.

Stop `ansible_rulebook` (Ctrl-c)

Create the following playbook, `bgp_status.yml`:

    ---
    - name: BGP Change Observation
      hosts: localhost
      connection: local
      gather_facts: false

      tasks:

        - name: Send notification message via Mattermost
          community.general.mattermost:
           url: http://podman-host:8065
           api_key:                ######### YOUR API KEY #########
           attachments:
             - text: "!!!!!! ALERT !!!!!!"
               color: '#ff00dd'
               title: BGP ERROR
               fields:
                - title: Issue
                  value: "BGP {{ ansible_eda.event.fields.session_state }} session Detected"
                  short: true
                - title: Details
                  value: "Neighbor Address: {{ ansible_eda.event.tags.neighbor_address }} from switch {{ ansible_eda.event.name }}"
                  short: true
          delegate_to: localhost


**REMEMBER: You will need the API key added to the playbook you just created!**


Now lastly, change the `port_status.yml` playbook by removing your debug action and replacing it with the playbook action:

       - name: BGP change detected
         condition: event.fields.session_state == "IDLE"
         action:
          run_playbook:
           name: bgp_status.yml


Once done, save your rulebook and start it up.
`    ansible-rulebook --rulebook port_status.yml -i inventory.yaml --print-events`

Test it by bringing down the `cEOS 03` interface again and seeing if you get notified in the company chat.
Navigate to `cEOS 03` and shut down ethernet 3 to simulate a fault.

`ceos3(config-if-Et3)# shut`

If you had recently done a `shut`, you many need to do `no shut` first followed by `shut`

See if you got notified in the company chat!


☑️ Dont just talk about it!
===
Lastly, in this challenge we are going to add on to our BGP example. So far we have used Event-Driven Ansible to listen to an event, match it with a condition, and send a notification into our team's Chat application.

Maybe we can help with some troubleshooting, so when the team decides to look at the issue they know that a few basic steps have taken place already.

Now, there could be many things to check or troubleshoot for a BGP error since there are many possibilities. But for our example its pretty simple and we will build a playbook that will check the BGP status, and we can follow it up with a connectivity test.  Create a playbook in `ansible_rulebook` tab and call it `bgp_troubleshooting.yml`

    ---
    - name: Basic Troubleshooting BGP
      hosts: ceos1
      gather_facts: false
      vars:
        switches:
          - ping 10.0.0.1
          - ping 10.0.0.4

      tasks:

        - name: BGP Check
          arista.eos.eos_command:
           commands: show ip bgp summary vrf all
          register: bgp_summary

        - name: Check reachability of switches
          arista.eos.eos_command:
           commands: "{{ switches }}"
          register: result

        - set_fact:
           cacheable: true
           bgp_view: "{{ bgp_summary }}"
           bgp_ping: "{{ result }}"
           status: done
           bgp_state: "{{ ansible_eda.event.fields.session_state }}"
           bgp_prob_neighbor: "{{ ansible_eda.event.tags.neighbor_address }}"
           bgp_timestamp: "{{ ansible_eda.event.timestamp }}"
           bgp_error_type: "{{ ansible_eda.event.tags.identifier }}"


Note: the above playbook has introduced something here, and that is setting facts. Apart from the facts from the troublshooting plays, you will notice that we have set facts which are referencing event data. This is so we can pass the fact and make it available for other playbooks or perhaps providing playbook artifacts back into ansible-rulebook.

Let's add it to our rulebook. In this rulebook we are going to add the two conditions with actions, which will run one after the other. You will see we have added `post_events` to the troubleshooting action. This ensures we have access to artifacts from that playbook available to us and we can then use it for the next condition.

       - name: BGP change detected
         condition: event.fields.session_state == "IDLE"
         action:
           run_playbook:
            name: bgp_troubleshooting.yml
            post_events: true

       - name: Trouble shoooting finished
         condition: event.status == "done"
         action:
            run_playbook:
              name: bgp_status.yml


Lastly, we want to notify our team on the company chat, so lets alter the `bgp_status.yml` playbook.

    ---
    - name: BGP Change Observation
      hosts: localhost
      connection: local
      gather_facts: false

      tasks:

        - name: Send notification message via Mattermost
          community.general.mattermost:
           url: http://podman-host:8065
           api_key:   ######### YOUR API KEY #########
           attachments:
             - text: "!!!!!! ALERT !!!!!!"
               color: '#ff00dd'
               title: BGP ERROR
               fields:
                - title: Issue Detected
                  value: "BGP Session: {{ ansible_eda.event.bgp_state }}"
                  short: true
                - title: Potential Problem
                  value: "Problematic node/path: {{ ansible_eda.event.bgp_prob_neighbor }}"
                  short: true
                - title: Message
                  value: "Event detected issue, human intervention is required, Dave"
                  short: true
          delegate_to: localhost


**REMEMBER: You will need the API key added to the playbook you just modified/created!**

Thats it!
Time to test and move on! If you had recently done a `shut`, you many need to do `no shut` to set the port back up.

    ansible-rulebook --rulebook port_status.yml -i inventory.yaml --print-events

Switch off the Ethernet 3 interface on the switch and lets see the magic!
Navigate to `cEOS 03` and shut down ethernet 3 to simulate a fault.

	`ceos3(config-if-Et3)# shut`

Please check the chat screen.
