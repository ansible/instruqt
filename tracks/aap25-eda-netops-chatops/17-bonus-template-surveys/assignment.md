---
slug: bonus-template-surveys
id: hggk2clfdjwf
type: challenge
title: '17- BONUS: Automation Controller - template surveys'
teaser: Learn how to set variables for a playbook dynamically in a user-friendly question
  and answer way!
notes:
- type: text
  contents: |-
    # Automation Controller - template surveys

    Job types of `Run` and `Check` provide a way to set up `surveys` for a `Job Template`. Surveys set extra variables for the playbook similar to ‘Prompt for Extra Variables’ does, but in a user-friendly question and answer way. Surveys also allow for validation of user input. Click the Survey tab to create a survey.

    Use cases for surveys are numerous. An example might be if operations wanted to give developers a “push to stage” button they could run without advanced Ansible knowledge. When launched, this task could prompt for answers to questions such as, “What tag should we release?”

    Many types of questions can be asked, including multiple-choice questions.
tabs:
- id: beeqyygwhmt1
  title: kafka
  type: terminal
  hostname: broker
- id: bzyxe2d35s9y
  title: Terminal
  type: terminal
  hostname: devtools
  workdir: /home/rhel
  cmd: su - rhel
- id: pihdd3ot94sk
  title: telegraf
  type: terminal
  hostname: control
- id: a27462fvsgzx
  title: AAP
  type: service
  hostname: control
  port: 443
- id: holsjmpecytr
  title: chat
  type: service
  hostname: podman-host
  path: /
  port: 8065
difficulty: ""
timelimit: 0
enhanced_loading: null
---
🎉 Success!
===
If you want to try the **Survey** feature of Ansible Automation Platform continue with the tasks below.

> [!IMPORTANT]
> BONUS TRACK!
> This is an ***optional bonus tracks*** for this workshop. If you want to finish right now and skip this challenge, simply press the `Next` button at the bottom.

📑 Bonus track: Job Template with a Survey
===

In this challenge, we will explore the **Survey** feature, which allows us to input a variable at runtime when we execute our **Job Template** (playbook), making it possible to change a parameter or setting at each run. We will be changing the login banner of the Cisco Cat8000v device we set previously in one of the initial exercises using a **Survey**.

☑️ Task 1 - Creating the Job Template
===

1. Go to the [button label="AAP"](tab-2) tab and click the **Templates** link under the **Automation Execution** section of the sidebar.

  ![aap templates](../assets/aap_templates.png)

2. Click the **Create template** dropdown button and select **Create job template**. Fill out the form with the following details.

  ![create job templates](../assets/create_job_templates.png)

3. Fill out the form with the following details and click on **Create job template**.

  ```bash
  Name: Update Banner
  Description: Create or update banner on Cat8000v using Surveys
  Job type: Run
  Inventory: NetOps Inventory
  Project: NetOps Playbooks
  Playbook: solutions/playbooks/banner.yml
  Credentials: cat8000v-credential
  ```

![Jan-24-2025_at_17.10.53-image.png](../assets/Jan-24-2025_at_17.10.53-image.png)

### But what did we import?

The `banner.yml` configures a banner on Cisco devices. The `banner` and the `text` parameters are set to `banner_type` and `network_banner` variables respectively. In the previous exercise involving banners, we populated those variable by loading them from a file. This time, we are going to take these as inputs from a `survey` while launching the job template.

☑️ Task 2 - Adding surveys to the Job Template
===

1. Once the job template is created, go to the `Survey` tab.

![Jan-24-2025_at_17.11.42-image.png](../assets/Jan-24-2025_at_17.11.42-image.png)

2. Click on **Create survey question**.
3. Fill the form with the following details and click on **Create survey question** blue button.

  ```bash
  Question: What is the banner type?
  Description: Enter a supported banner type
  Answer variable name: banner_type
  Answer type: Text
  ```

  ![banner survey question 1](../assets/banner_survey_3.png)

4. Click on **Create survey question** once done.
5. Let's create another question.
6. Click on **Create survey question** again,  and fill the form with the following details this time.

  ```bash
  Question: What is the banner message?
  Description: Enter the banner message
  Answer variable name: network_banner
  Answer type: Text
  ```

  ![banner survey question 2](../assets/banner_survey_4.png)

7. Click on **Create survey question** once done.
8. Now to finish, let's enable the survey for this Job Template.

  ![banner survey enable](../assets/banner_survey_5.png)

☑️ Task 3 - Executing the Job Template
===

1. Once survey is enabled for this Job Template, launch it by clicking on the **Launch Template** button.

  ![banner survey launch](../assets/banner_survey_launch.png)

2. This will start the survey. Enter answers for the `What is the banner type?` and `What is the banner message?` questions. Click on **Next**.

  ```bash
  What is the banner type? - login
  What is the banner message? - Login banner set with survey
  ```

  ![banner survey questions](../assets/banner_survey_questions.png)

3. Review the `Extra vars` set and click on **Finish**. The job template would start to run. Wait for it to complete.

  ![banner survey questions 2](../assets/banner_survey_questions_2.png)

☑️ Task 4 - Verifying the banner
===

1. Go to the [button label="Terminal"](tab-4) tab and ssh to the `cisco` device.

  ```bash
  ssh admin@cisco
  ```

2. As you login to the device, you should already see the new banner message.


✅ What's Next?
===
That's the end of the bonus exercise for this workshop. If you wish to explore more hands-on labs with Ansible, go to [Ansible Interactive Labs](https://red.ht/ansible-labs) page.

For any feedback or for reporting issues around this workshop, please open an issue in the [ansible/instruqt](https://github.com/ansible/instruqt) repository.

Thank you for you time! Happy Automating! 🎉
