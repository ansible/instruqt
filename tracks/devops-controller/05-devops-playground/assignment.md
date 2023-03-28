---
slug: devops-playground
id: u7mqil4vqcpn
type: challenge
title: Playground
teaser: Use the remaining time to try it out yourself! This challenge has no checks
  so feel free to experiment and explore!
notes:
- type: text
  contents: |-
    # Challenge summary
    This is the playground. Feel free to experiment and try different options!

    ![env_tools](../assets/img/slides_5_cicd_complete.png)

    <style type="text/css" rel="stylesheet">
    h1,h2{
      text-align: center;
    }
    p {
      text-align: center;
    }
    img {
      display: block;
      margin-left: auto;
      margin-right: auto;
      width: 80%;
    }
    </style>
tabs:
- title: Controller
  type: service
  hostname: devops-controller
  port: 443
- title: VS Code
  type: service
  hostname: devops-controller
  path: /editor/?folder=/home/student/acme_corp
  port: 443
- title: Gitea
  type: service
  hostname: devops-controller
  path: /student/acme_corp
  port: 8443
- title: Jenkins
  type: service
  hostname: devops-controller
  path: /job/ACMECorp/
  port: 6443
- title: Let's Quiz!
  type: service
  hostname: devops-controller
  port: 8000
difficulty: intermediate
timelimit: 1440
---
🔐 Login credentials
===
All the logins use the same credentials.

>User: student<p>
>Password: learn_ansible

👋 Introduction
===

In this lab, we've used automation controller's enterprise features to enhance how the ACME Corp development and operations teams integrate and automate together.

Now it's your turn try!

✅ Where to go next
===

Whether you are beginning your automation journey or a seasoned veteran, there are a variety of resources to enhance your automation knowledge:

* [Self-paced exercises](https://www.redhat.com/en/engage/redhat-ansible-automation-202108061218) - Explore our all self-paced labs
* [Trial subscription](http://red.ht/try_ansible) - Are you ready to install in your environment? Get your trial subscription for unlimited access to all the components of Ansible Automation Platform.
* [Subscribe to the Red Hat Ansible Automation Platform YouTube channel. ](https://www.youtube.com/ansibleautomation)

🐛 Encountered an issue?
====
If you need to restart the entire workflow, run the `Restart DevOps Workflow` job template in automation controller.

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=devops-controller&title=New+DevOps+with+automation+controller+issue+issue:+incident-creation&assignees=craig-br).

<style type="text/css" rel="stylesheet">
  .lightbox {
    display: none;
    position: fixed;
    justify-content: center;
    align-items: center;
    z-index: 999;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 1rem;
    background: rgba(0, 0, 0, 0.8);
    margin-left: auto;
    margin-right: auto;
    margin-top: auto;
    margin-bottom: auto;
  }
  .lightbox:target {
    display: flex;
  }
  .lightbox img {
    max-width: 60%;
    max-height: 60%;
  }
  img {
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  h1 {
    font-size: 18px;
  }
    h2 {
    font-size: 16px;
    font-weight: 600
  }
    h3 {
    font-size: 14px;
    font-weight: 600
  }
  p span {
    font-size: 14px;
  }
  ul li span {
    font-size: 14px
  }
</style>