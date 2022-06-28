---
slug: update-app
id: jixtci9el84k
type: challenge
title: Updating the ACME Corp application code
teaser: In this lab, we'll update the *Let's Quiz!* application to trigger a pipeline
  buid.
notes:
- type: text
  contents: |-
    # Challenge summary
    In this challenge, we'll update the ACME Corp *Let's Quiz!* application code and start the pipeline
    by pushing our changes to the ACME Corp source code repository.

    ![env_tools](../assets/img/slides_3_update_app.png)

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
- title: VS Code
  type: service
  hostname: controller
  path: /editor/?folder=/home/rhel/acme_corp
  port: 443
- title: Jenkins
  type: service
  hostname: jenkins
  path: /job/ACMECorp/
  port: 8080
- title: Gitea
  type: service
  hostname: gitea
  path: /student/acme_corp
  port: 3000
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

#### Estimated time to complete: _10 minutes_<p>

ACME Corp needs to update the _Let’s Quiz!_ application home page. In this challenge, we’ll update the application in VS Code and trigger the Gitea webhook described in the initial _Environment overview_ challenge.

☑️ Task 1 - Updating the ACME Corp home page
===

Let’s update the ACME Corp home page.

* The _VS Code_ tab should be open by default.
* On the VS Code Explorer pane, navigate to `app ⇒ lets_quiz ⇒ templates ⇒ quiz` and click on `home.html`.

![VSCode home.html](../assets/img/vscode_home_edit.png)

We’ll edit the line directly under the  `<!-- FIX ME -->` comment in `home.html`.

* Copy and paste the below line and replace the existing line directly under the  `<!-- FIX ME -->` comment.
```html
<p class="display-4 d-none d-sm-block">The latest and greatest version of the app deployed successfully.</p>
```
* Save the file by either clicking on `File ⇒ Save` on the VS Code menu bar or the relevant keyboard shortcut.

☑️ Task 2 - Commit and push the code to start the pipeline
===

Next, we’ll commit and push the updated code to the _Gitea_ repository.

* On the left VS Code Explorer pane, click on the `Source Control` Git icon with the number banner. In the image below, the number banner is `1`.
* Click on the + sign next to the `home.html` file.
* Enter a commit message in the `Message` text input. For example, a commit message could be.

```
Updated home.html
```

![VSCode commit](../assets/img/vscode_commit.png)

* Click on the ☑️ to commit the changes.
* A new `Sync Changes` button will appear. Click on it to push the code to the ACME Corp repository.

![VSCode commit](../assets/img/vscode_push.png)

☑️ Task 3 - Check the pipeline status
===

Let's see if the *Gitea* webhook started the pipeline.

* Click on the _Jenkins_ tab at the top of the browser window.
* In the _Pipeline ACMECorp_ window, you’ll see that the _Gitea_ webhook started the pipeline.
* In the Jenkins UI, click on the *number* icon to open the Jenkins build. In the below image, the build number is `1`.

![Jenkins running](../assets/img/jenkins_acme_job_running.png)

* Now, click on the `Console Output` button on the left pane in the new window.

![Jenkins running](../assets/img/jenkins_acme_console_button.png)

The pipeline successfully created the new package version and initiated the automation controller `DevOps Workflow` job template.

![Jenkins running](../assets/img/jenkins_acme_console_bottom.png)

>**❗️ Note**
>
>The pipeline will not finish at this stage of the lab. We’ll continue with the DevOps workflow in the next challenge.

The `tag_name` variable contains the latest _Let’s Quiz!_ application version. In the image above, the `tag_name` variable is set to `2.52.0`. We’ll use the `tag_name` variable in controller for the following challenges.

☑️ Task 4 - Check the ACME Corp repository
===

Let’s look at the ACME Corp repository hosted in _Gitea_.

* Click on the _Gitea_ tab at the top of the browser window.
* The pipeline pushed the code to _Gitea_ and created a new tag.

![Gitea updated](../assets/img/gitea_new_tag.png)

* The Jenkins commit message shows the latest version number. In the screenshot below, the commit message is `Bump version from v2.51.0 to v2.52.0`.
* Click on the `Tag` button in the right-hand corner.

![Gitea tag](../assets/img/gitea_tag_artifacts.png)

_Gitea_ created `ZIP` and `TAR.GZ` files associated with the new tag. In the above screenshot, the tag name is `v2.52.0`. We’ll use this tag number and artefacts in the next challenge.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the tasks.

🐛 Encountered an issue?
====
If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=devops-controller&title=New+DevOps+with+automation+controller+issue+issue:+incident-creation&assignees=craig-br).

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