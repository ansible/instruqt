---
slug: project-events-act
id: crqv9wwufdzz
type: challenge
title: Act on project events
teaser: Receive and respond to project events
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
- title: APP
  type: service
  hostname: rhel
  path: /
  port: 8080
difficulty: basic
timelimit: 600
---
Now that we have seen `ansible-rulebook` recieve events from our project repository, it's time to act on those events.

In this scenario, we're going to deploy a simple containerized flask application that can be configured with environment variables defined in an ansible playbook.

First, we'll need to modify our `webhook.yml` rulebook to listen for push events coming from Gitea and then specify an action to be taken when an event is recieved.

- Open `webhook.yml` in the Editor tab
- Notice that the contents of this file have been overwritten to include additional conditions and actions
- The pattern of each rule follows: `name:` of the rule, and a `condition:` which triggers some `action:`
- Notice the different actions being used. Not every action is performed by `ansible-rulebook` directly, some rules execute playbooks.

The contents of our rulebook dictate that `ansible-rulebook` will listen for events on an endpoint, disregard some json keys returned in output, and then pass the event to the rules to evaluate for matching conditions.

The first rule is merely matching events and creating friendly variables for the parameters we need from the event in order to trigger additional actions.

The second rule will run a playbook to clone the project repository and the third rule will deploy the application.

Run the rulebook with:
```
ansible-rulebook --rulebook webhook.yml -i inventory.yml --verbose
```

Next, go to the project repository and modify the color variable in `deploy.yml`.
- Push the change directly to the main branch.
- Go back to the EDA tab and monitor the output.
- Finally, check the APP tab once the event processing has completed. You should see an application whose background color matches the color you specified in `deploy.yml`. Magnificent!

Try modifying `deploy.yml` again with another color specified. As long as `ansible-rulebook` is running that `webhook.yml` rulebook, it should be listening for new push events from Gitea.

Exit the EDA application with `ctrl+c` in the EDA and continue to the next challenge.

Awesome!
