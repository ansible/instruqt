---
slug: eda-playground
id: lxt7riqllrsp
type: challenge
title: EDA playground
teaser: Playground environment
tabs:
- title: Gitea
  type: service
  hostname: podman
  path: /student/eda-app
  port: 3000
- title: Editor(EDA)
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
- title: App(dev)
  type: service
  hostname: rhel
  path: /
  port: 8081
- title: RHEL(cli)
  type: terminal
  hostname: rhel
difficulty: basic
timelimit: 1200
---
You have completed all challenges demonstrating how repository events can be used by Event-driven Ansible to deploy applications in a gitops fashion.

If you'd like to modify any of the project files within this environmen or respond to different repository events, this is the place to try it!

A new tab has also been added. The RHEL(cli) tab is the host that the containerized applications are running. You should be able to see these containers running in the output of `sudo podman container list`.

I hope you have enjoyed this track! If you have any feedback, feel free to share by opening issues here: https://github.com/ansible/instruqt/issues