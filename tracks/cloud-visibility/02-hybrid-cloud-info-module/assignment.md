---
slug: hybrid-cloud-info-module
id: bjcbifhf5o4y
type: challenge
title: Retrieve public cloud information
teaser: Create job templates in automation controller to retrieve public cloud structured
  data
notes:
- type: text
  contents: |-
    # Challenge summary

    In this challenge, you'll perform automation against your AWS public cloud environment.  You will also learn how to create a `Job Template` in Automation controller.

    You will launch a number of job templates to perform the following:
    - Retrieve information about VPCs (<a target="_new" href="https://docs.aws.amazon.com/vpc/latest/userguide/configure-your-vpc.html">Virtual Private Cloud</a>)
    - Retrieve information about EC2 instances (<a target="_new" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html">virtual computing environments</a>
    - Retrieve information about IGWs (<a target="_new" href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html">internet gateways</a>)
- type: text
  contents: |-
    # Infrastructure visibility

    Cloud automation begins and ends with structured data.  Ansible can help retrieve information from your public cloud to help you understand your cloud footprint.

    <img src="https://github.com/IPvSean/pictures_for_github/blob/master/visbility.png?raw=true">
- type: text
  contents: |+
    # Understanding Job Templates

    A job template is a definition and set of parameters for running an Ansible job. Job templates are useful to execute the same job many times. Job templates also encourage the reuse of Ansible playbook content and collaboration between teams.

    <img src="https://github.com/IPvSean/pictures_for_github/blob/master/job_template.png?raw=true">

- type: text
  contents: |-
    # Lets get started

    That is the end of of your challenge briefing!

    Once the lab is setup you can click the Green start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="left"> in the bottom right corner of this window.
tabs:
- id: ryk3mt1oogaj
  title: Ansible Automation Controller
  type: service
  hostname: controller
  port: 443
- id: rcuzyp1lngfk
  title: AWS console
  type: service
  hostname: cloud-client
  path: /
  port: 80
difficulty: ""
timelimit: 900
---
👋 Introduction
===
#### Estimated time to complete: *5 minutes*<p>
Welcome to the second challenge.  For this challenge we will learn how to retrieve public cloud information with a job template.

Login to Automation controller with the following credentials

<table>
<tr>
<td>username:</td>
<td><code>admin</code></td>
</tr>
<tr>
<td>password:</td>
<td><code>ansible123!</code></td>
</tr>
</table>

☑️ Task 1 - Create a Job Template
===

To create a **Job Template** we need three main components:
1. An **inventory** to run the automation against
2. A **credential** to access the API
3. A **project** to sync playbooks from.

Click the **Templates** link in the left navigation menu underneath the Resources tab.

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/job_templates.png?raw=true" style="width:150px;margin-left:0px">

- Now click on `Add` then scroll down and click  `Add job template`

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/add_job_template.png?raw=true" style="width:200px;margin-left:0px"><br>
Fill out the following fields:
<hr>
<table>
<tr><th>Parameter</th><th>Value</th>
</tr>
<tr><td>Name</td><td>Retrieve VPC info</td>
<tr><td>Job Type</td><td>Run</td>
<tr><td>Inventory</td><td>Demo Inventory</td>
<tr><td>Project</td><td>AWS Demos Project</td>
<tr><td>Execution Environment</td><td>AWS Execution Environment</td>
<tr><td>Playbook</td><td><code>playbooks/info_vpcs.yml</code></td>
<tr><td>Credentials</td><td><code>aws_credential</code></td>
</table>
<hr>

* If you have trouble finding the `aws_credential` make sure you are looking under the Credential Type `Amazon Web Services`

Click the blue **Save** button.


The project we are loading Ansible Playbooks from can be found here [https://github.com/ansible-cloud/aws_demos](https://github.com/ansible-cloud/aws_demos)


☑️ Task 2 - Launch the Job Template
===

Click the **Templates** link in the left navigation menu underneath the Resources tab.  You will see your `Retrieve VPC info` job template.

Click the rocket symbol to `Launch Template`.
<img src="https://github.com/IPvSean/pictures_for_github/blob/master/launch_job.png?raw=true" style="width:80px;margin-left:0px">

This playbook has two tasks. The first task `amazon.aws.ec2_vpc_net_info` will retrieve structured data for VPCs (by default this will use `us-east-1`).  The 2nd task will use the `debug` module to print this out to the terminal which we can see in the automation controller job window.

Click on the `print vpc info to terminal` task output then click on the `JSON` tab.  You will see the structured data retrieve for VPCs on us-east-1.  We have pre-configured one (1) VPC on this region.

![picture of json output](https://github.com/IPvSean/pictures_for_github/blob/master/public_cloud_json_output.png?raw=true)

This structured data can be used in our future challenge to crate dynamic documentation.


☑️ Task 3 - Create a Survey
===

Click the **Templates** link in the left navigation menu underneath the Resources tab.  You will see your `Retrieve VPC info` job template.

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/job_templates.png?raw=true" style="width:200px;margin-left:0px">

* Click the `Retrieve VPC info` link to open the job template.
* Now, click the `Survey` tab at the top of the job template.

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/survey_tab.png?raw=true" style="width:400px;margin-left:0px">

* Click the blue `Add` button.

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/survey_add.png?raw=true" style="width:100px;margin-left:0px">

Fill out the following values:
<hr>

<table>
<tr><th>Parameter</th><th>Value</th>
</tr>
<tr><td>Question</td><td>What AWS region?</td>
<tr><td>Description</td><td>choose the AWS region you want</td>
<tr><td>Answer variable name</td><td><code>ec2_region</code></td>
<tr><td>Answer type</td><td>Multiple Choice (single select)</td>
<tr><td>Required</td><td>☑️</td>
<tr><td>Multiple Choice Options</td><td><ul><li>us-east-1</li><li>us-east-2</li><li>eu-central-1</li></ul></td>
</table>

Click the Default checkmark next to `us-east-1`

Click the blue **Save** button.

<hr>

Make sure to click the toggle button to enabled the survey.

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/survey_enabled.png?raw=true" style="width:200px;margin-left:0px">

Either click the `Details` tab or click the **Templates** link in the left navigation menu underneath the Resources tab.  You will see your `Retrieve VPC info` job template again.  Launch the job again.

<hr>

This time you will see a survey prompt:

<img src="https://github.com/IPvSean/pictures_for_github/blob/master/what_region.png?raw=true" style="width:200px;margin-left:0px">

Surveys set extra variables for the playbook in a user-friendly question and answer way.  This allows you to abstract complexity using question and answer format.

Feel free to choose another region (other than us-east-1) and verify the output is different from us-east-1.


☑️ Task 4 - Optional - Create more job templates
===

This is an optional task.  There is two more job templates similar to the `Retrieve VPC info` one we can create for EC2 instances and IGW (internet gateways) for AWS.  Create the following two job templates:


<table>
<tr><th>Parameter</th><th>Value</th>
</tr>
<tr><td>Name</td><td><b>Retrieve EC2 instances info</b></td>
<tr><td>Job Type</td><td>Run</td>
<tr><td>Inventory</td><td>Demo Inventory</td>
<tr><td>Project</td><td>AWS Demos Project</td>
<tr><td>Execution Environment</td><td>AWS Execution Environment</td>
<tr><td>Playbook</td><td><code>playbooks/info_instances.yml</code></td>
<tr><td>Credentials</td><td><code>aws_credential</code></td>
</table>

<hr>

<table>
<tr><td>Name</td><td><b>Retrieve IGWs info</b></td>
<tr><td>Job Type</td><td>Run</td>
<tr><td>Inventory</td><td>Demo Inventory</td>
<tr><td>Project</td><td>AWS Demos Project</td>
<tr><td>Execution Environment</td><td>AWS Execution Environment</td>
<tr><td>Playbook</td><td><code>playbooks/info_igws.yml</code></td>
<tr><td>Credentials</td><td><code>aws_credential</code></td>
</table>

These will provide structured data for EC2 instances and IGWs respectively.  Try adding a survey to them as well!

<hr>

Going even further... what if we combined all of these?  Create one more job template:

<table>
<tr><td>Name</td><td><b>Retrieve Combined info</b></td>
<tr><td>Job Type</td><td>Run</td>
<tr><td>Inventory</td><td>Demo Inventory</td>
<tr><td>Project</td><td>AWS Demos Project</td>
<tr><td>Execution Environment</td><td>AWS Execution Environment</td>
<tr><td>Playbook</td><td><code>playbooks/info_combined.yml</code></td>
<tr><td>Credentials</td><td><code>aws_credential</code></td>
</table>

This last one may look formatted incorrectly inside automation controller but what it is actually doing is combining the structured data from VPCs, EC2 instances and IGWs to create infrastructure awareness for the cloud administrator.  This is what the standard out will look like (non-JSON):

![picture of combined output](https://github.com/IPvSean/pictures_for_github/blob/master/cloud_awareness.png?raw=true)

A cloud operator can quickly see how many instances are online in that region, and what VPCs they are on, as well as the associated IGW.  This is combining several info modules which correspond to multiple AWS boto3 API calls.  In the above image I can quickly see there is multiple VPCs that I can retire because they are not in use.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?title=Issue+with+Ansible+Hybrid+Cloud+Automation+-+Infrastructure+visibility&assignees=ipvsean).

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
