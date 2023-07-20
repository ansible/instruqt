---
slug: project-events
id: 4xaoebww5oet
type: challenge
title: Receive project events
teaser: Recieve and debug project events
tabs:
- title: Gitea
  type: service
  hostname: podman
  path: /student/eda-app
  port: 3000
- title: Editor (EDA)
  type: code
  hostname: ansible-events
  path: /root/project/
- title: EDA
  type: terminal
  hostname: ansible-events
  workdir: /root/project/
difficulty: basic
timelimit: 600
---
An Ansible rulebook combines sources and actions to observe, evaluate and act as events occur.

Now that the project repository is sending events, next up is configuring `ansible-rulebook` to listen for these events.

Lets start off with a simple example. All we'll do with this rulebook is listen for events and print the received payload.

- First, go to the "Editor" tab and open the file called `webhook.yml`
- Take a beat to read through this rulebook!
  - You should see that this particular rulebook is using the webhook source event to recieve new events
  - On recieving an event payload, the single rule action is just to print out the event data using the `debug` action
- Next, go to the EDA tab and execute `ansible-rulebook` against the rulebook you just created:
```
ansible-rulebook --rulebook webhook.yml -i inventory.yml
```

Now that `ansible-rulebook` is listening on port 5000 for webhook POSTs, it's time to test the project repository again.
- Open up the project repository in the Gitea tab
- Navigate to the project repository by selecting the "Explore" tab, and then "eda-app"
- From here, go to "Settings", press "Webhooks" and click on the webhook configuration you created previously
- Scroll to the bottom of the page, and select "Test Delivery"

Head back to the EDA tab, and inspect the output. You should see the payload of the event printed in the console.
- Exit the app with `ctrl+c`