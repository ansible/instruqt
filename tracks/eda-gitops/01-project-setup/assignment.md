---
slug: project-setup
id: ymg0z7xkntxf
type: challenge
title: Gitea project setup
teaser: Setup a project and configure it to send events to ansible-rulebook
tabs:
- title: Gitea
  type: service
  hostname: podman
  port: 3000
- title: cli
  type: terminal
  hostname: podman
difficulty: basic
timelimit: 6000
---
This challenge walks through setting up a project on gitea that will push events to `ansible-rulebook` for processing.

First thing to do create a new project repository in Gitea.
- Login with the following credentials:
```
username: student
password: learn_ansible
```
- Next, use the + button in the top right and select "New Migration."
- Select the Github tile and enter a clone URL of: `https://github.com/cloin/eda-app`
- Press the green "Migrate Repository" button

You should be redirected to a new project repository created in your account! Great!
Next, we need to configure this repository to publish events to a webhook that `ansible-rulebook` will be able to capture.
- On the project repository page, select "Settings" in the top right under "Fork"
- Navigate to the "Webhooks" tab and press the "Add Webhook" button and select "Gitea" from the dropdown
- For "Target URL", enter: `http://ansible-events:5000/endpoint`
- For "Trigger On", select "Custom Events..." and check the boxes for:
    - Push
    - Pull Request
- For "Branch Filter", replace the default value with "main"
- Press the green "Add Webhook" button

Now, test the webhook!
- You should see a new webhook has been created, click the link for this webhook.
- Scroll down and press "Test Delivery"

Delivery will fail **(it's not your fault!)**, but you should be able to scroll to the bottom of the page and click on the ID for this delivery. Take a look at the headers and content that was sent as part of the event payload.

`ansible-rulebook` is able to recieve this payload and use these values to conditionally trigger an action.

Additionally, this event data is made available to actions such as running a playbook. This means that the json values you see before you can be reused in playbooks. Neat!
