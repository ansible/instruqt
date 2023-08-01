---
slug: project-pr
id: 77iwhl0qdooc
type: challenge
title: Additional project event types
teaser: Pull request, publish to dev, promote to production
tabs:
- title: Gitea
  type: service
  hostname: podman
  path: /student/eda-app
  port: 3000
- title: Editor
  type: code
  hostname: ansible-events
  path: /root/project/
- title: EDA
  type: terminal
  hostname: ansible-events
  workdir: /root/project/
- title: APP(prod)
  type: service
  hostname: rhel
  path: /
  port: 8080
- title: APP(dev)
  type: service
  hostname: rhel
  path: /
  port: 8081
difficulty: basic
timelimit: 600
---
Well, that's neat. So now `ansible-rulebook` is recieving push events on main. But what about other event types?

Let's try to implement a more realistic scenario. This time, we want to listen for new pull requests and before updating the application in production, lets deploy it in development. Once we see the application successfully deployed in development, we can merge the pull request which then should re-deploy our production application with the changes in our pull request.

Open up `webhook.yml` once again in the Editor tab.
- Notice that the rulebook has once again been expanded
- Additional rules have been added to recieve pull_request event types
- A new playbook is available that will apply the pull request commits to the local clone
- The existing deploy playbook will be leveraged to deploy the application to development

So try it out! First, start `ansible-rulebook` against `webhook.yml` from the EDA tab:
```
ansible-rulebook --rulebook webhook.yml -i inventory.yml --verbose
```

In the Gitea tab, once again modify the color variable in the `deploy.yml` file. This time, instead of committing straight to main, select the bottom radio button to create a new branch for this commit and then press the "Propose file change" button.

On the next page, press the "New Pull Request" button. You should now be looking at a pull request creation page allowing you to edit the title and description of your new PR. When finished, press the "Create Pull Request" button in the bottom right corner.

Upon creating the PR, go back to the EDA tab and see that the event is picked up and processed. Once finished, check the "APP(dev)" tab to see that the application has been deployed with the new color and the page text should reference your branch name. Now, check the "App(prod)" tab to see that the color is unchanged.

Go back to Gitea and merge the pull request by pressing the "Create merge commit" button, and again pressing the "Create merge commit" button.

This generates a push event. Go check the EDA tab to see that the even is picked up, and once complete, check the "APP(prod)" tab to see that the application has been re-deployed with the changes from "APP(dev)"