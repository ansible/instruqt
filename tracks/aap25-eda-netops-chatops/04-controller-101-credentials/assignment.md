---
slug: controller-101-credentials
id: wmexrdvi9dyt
type: challenge
title: 4. Automation Controller - Get to know Credentials
teaser: Check the authentication options of automation controller
notes:
- type: text
  contents: |-
    # Credentials

    ![credentials-demo-edit-details.png](../assets/credentials-demo-edit-details.png)

    Credentials are utilized for authentication when launching Jobs against machines, synchronizing with inventory sources, and importing project content from a version control system.
tabs:
- id: jyniydol83ok
  title: AAP
  type: service
  hostname: control
  port: 443
- id: g5lyuzdidsgy
  title: gitea
  type: service
  hostname: gitea
  path: /
  port: 3000
difficulty: ""
timelimit: 0
enhanced_loading: null
---
🔐 Credentials
===

**Credentials** are utilized by Ansible Automation Platform for authentication when launching jobs against devices or managed nodes, synchronizing with inventory sources, and importing project content from a version control system.

Credentials are imported and stored encrypted within Ansible Automation Platform, and are not retrievable in plain text on the command line by any user. You can grant users and teams the ability to use these credentials, without actually exposing the credential to the user itself.

There are multiple types of credential types, ranging from tokens, to user/passwords or public keys. In total, there are over 20 supported types and in case something is not covered, we  have the option to create a *Custom credential type*. We will explore the **Machine** credential type today, which we will use to connect to the servers in our inventory through SSH.

> [!IMPORTANT]
> In this exercise we are not making any changes. Credentials are pre-loaded. Please do not modify the input in the fields.

☑️ Task 1 - Exploring the Credentials section
===

1. In the sidebar, expand the **Automation Execution** section.
2. Now expand the **Infrastructure** menu and click the **Credentials** option.

  ![credentials](../assets/aap_credentials.png)

3. This will display a searchable list of pre-loaded credentials, classified by name and type.
4. Look for the `cat8000v-credential`, notice it says **Machine** type. Click on it.

  ![cat8000v credential](../assets/cat8000v_credential.png)
5. Here you can see the details of the credential. Notice the **SSH Private Key** field says **Encrypted**.

6. Inside this view, click the tab **Job Templates** to see what Ansible playbooks are currently using this credential. It should be empty right now.

☑️ Task 2 - Exploring the Machine Type credential
===

1. Go back to the **Details** tab of the **cat8000v-credentials**
2. Click the **Edit credential** button
3. Look at the different fields available, but **don't edit or change anything**.
4. Notice how the **SSH Private Key** field only allows us to **Reset**. As we mentioned before, the key is encrypted and not retrievable.
5. To exit, click the **Cancel** button to avoid accidental modifications.

 ![credential details](../assets/credential_details.png)

✅ Next Challenge
===
Press the `Next` button below to go to the next challenge once you’ve completed the task.

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
