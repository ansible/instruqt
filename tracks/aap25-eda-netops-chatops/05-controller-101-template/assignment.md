---
slug: controller-101-template
id: ppqfpocggwps
type: challenge
title: 5. Automation Controller - Creating a Job Template
teaser: This is how you run a playbook with automation controller!
notes:
- type: text
  contents: |
    # Job templates

    ![job-templates-home-with-example-job-template.png](../assets/job-templates-home-with-example-job-template.png)

    In controller, job templates are a visual representation of the `ansible-playbook` command and all flags you can utilize when executing from the command line.
tabs:
- id: fepaie82v72y
  title: AAP
  type: service
  hostname: control
  port: 443
- id: sody2s4xa0uk
  title: Gitea
  type: service
  hostname: gitea
  path: /
  port: 3000
difficulty: ""
timelimit: 0
enhanced_loading: null
---
📑 Job Templates
===

In Ansible Automation Platform a **Job Template** is a definition and set of parameters for running an Ansible playbook. Job Templates are useful to execute the same job many times while also encouraging the reuse of Ansible content and collaboration between teams.

To create a **Job Template** you need to have a **Project** (a repository or directory) from which to source our *Playbooks*. We created our **Project** called `NetOps Playbooks` in the previous challenge. Also, note that although a **Project** might contain multiple *Playbooks*, a **Job Template** can only run one of those playbooks.

> [!WARNING]
> **Do not confuse a Job Template with a Jinja template**. Jinja templates are used to create dynamic template files, with variables and facts that will be replaced during runtime. This is very useful for configuration files for example. If you don't know Jinja, don't worry about it right now, just know that they are different things.

☑️ Task 1 - Creation of the Job Template
===

1. Click the **Templates** link under the **Automation Execution** section of the sidebar.

  ![aap templates](../assets/aap_templates.png)
2. Click the **Create template** dropdown button and select **Create job template**. Fill out the form with the following details.

  ![create job templates](../assets/create_job_templates.png)

3. **Name** the Job Template as `Configure SNMP`
4. For the **Job Type** field, leave the default: `Run`
5. For the **Inventory** field, click and and select `NetOps Inventory` from the dropdown
6. For the **Project** field, click and select `NetOps Playbooks` from the dropdown
7. For the **Playbook** field, click and you will notice that it's auto populated with all the playbooks available in the **Project** repository we selected. Choose the `solutions/playbooks/snmp.yml`. We are using a provided playbook for this exercise, in the following ones you will need to create the files.
8. For the **Credentials** field,  click and only tick `cat8000v-credential` from the dropdown. You can click outside the dropdown to close. No need to click browse right now, but if you do, simply click confirm.
9. The form should look like this after you filled it:
![Jan-31-2025_at_18.23.32-image.png](../assets/Jan-31-2025_at_18.23.32-image.png)
10. Leave all the other fields the same and click **Create job template**.

> [!IMPORTANT]
> Note that the **Credentials** field is not mandatory, but if you don't select the right credentials, the execution will fail.

☑️ Task 2 - Launch the new Template
===

1. Click the **Templates** link in the **Automation Execution** section of the sidebar.
2. You can launch it from this list, by clicking the **Rocket** icon, or by clicking on the `Configure SNMP` template and then clicking the **Launch** button at the bottom.

  ![launch](../assets/launch_job_template.png)

3. Verify the execution was successful and 1 device was "changed" (in yellow).
  ![Jan-21-2025_at_12.37.45-image.png](../assets/Jan-21-2025_at_12.37.45-image.png)
4. Congratulations! 🎉 You have successfully run your first Job Template in AAP!
5. If we run the same **Job Template** on the same devices as before, the output will be different because of idempotency
6. Try it! Launch the Job Template again by pressing the blue **Relaunch Job** button  at the top right.
![Jan-24-2025_at_13.49.41-image.png](../assets/Jan-24-2025_at_13.49.41-image.png)

✅ Next Challenge
===
Press the **Next** button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=netops-aap25&title=Issue+with+netops-aap25&assignees=leogallego)

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
    /* max-height: 100% */
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
