---
slug: devops-playground
id: 0lw2coaydkzw
type: challenge
title: Playground
teaser: Use the remaining time to try it out yourself! This challenge has no checks.
  Feel free to explore
notes:
- type: text
  contents: |-
    # Challenge summary
    The is the playground. Feel free to experiment and try different options!

    ![env_tools](../assets/img/env_tools.png)

    <style type="text/css" rel="stylesheet">
    h1,h2{
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
  hostname: controller
  port: 443
- title: VS Code
  type: service
  hostname: controller
  path: /editor/?folder=/home/rhel/acme_corp
  port: 443
- title: Gitea
  type: service
  hostname: gitea
  path: /student/acme_corp
  port: 3000
- title: Jenkins
  type: service
  hostname: jenkins
  path: /job/ACMECorp/
  port: 8080
- title: Let's Quiz!
  type: service
  hostname: controller
  port: 8000
difficulty: intermediate
timelimit: 600
---
🔐 Login credentials
===
All the logins use the same credentials.

>User: student<p>
>Password: learn_ansible

👋 Introduction
===

In this lab, we've used automation controller's enterprise features to enhance how the ACME Corp developemmt and operations teams integrate and automate together.

Now it's your turn try!

<style type="text/css" rel="stylesheet">
  img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 100%;
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