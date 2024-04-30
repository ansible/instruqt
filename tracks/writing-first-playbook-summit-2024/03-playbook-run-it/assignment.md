---
slug: playbook-run-it
id: na7pftxbupby
type: challenge
title: 1.2 - Run the playbook!
teaser: Let's see how it works!
notes:
- type: text
  contents: |-
    ![image.png](../assets/image.png)

    In the last challenge we created the playbook. Now it is time to launch it!

    We do this with the command `ansible-navigator` - one of the central commands of Ansible on the command line!
- type: text
  contents: During the task you might be wondering how `ansible-navigator` actually
    knows where to find the `hosts` file - this is configured in the file `/home/rhel/ansible-files/ansible-navigator.yml`
    which was pre-created in this environment. If you have time have a look at it,
    it should be fairly self-explanatory.
tabs:
- title: control
  type: terminal
  hostname: control
difficulty: ""
timelimit: 1
---
👋 1.2 - Run the playbook!
===

In this challenge, you will execute your Ansible Playbook from the control node using the `ansible-navigator` CLI tool.

☑️ Task 1 - Run the system_setup.yml Ansible Playbook
===

Within the *Control Terminal* tab, change into the `ansible-files` directory:

```
cd ansible-files
```

Run the playbook using `ansible-navigator`:

```
ansible-navigator run system_setup.yml
```

> [!IMPORTANT]
> The playbook task may take a minute or two to complete as it will download the container image and upgrade system packages in the managed node.

> [!NOTE]
> `-i hosts` option is not required as the inventory was configured in the `ansible-navigator.yml` settings file.

The output should not report any errors but provide an overview of the tasks executed and a "PLAY RECAP" summarizing what has been done.

![image.png](../assets/image.png)

There is a built-in task labeled `Gathering Facts` that runs automatically at the beginning of each Ansible play. It collects information about the managed nodes. Upcoming challenges will cover this in more detail.

☑️ Task 2 - Verify the user has been created
===

Within the *Control Terminal* tab, ssh into `node1` and verify the user exists manually:

```
ssh node1  id myuser
```


☑️ Task 3 - Idempotency at work
===

Run the Ansible Playbook a second time and compare the output to the original.


```
ansible-navigator run system_setup.yml
```

You will notice the tasks change from `changed` to `ok` including the colors changing from `yellow` to `green`.

Additionally, the *"PLAY RECAP"* summary at the end makes it easy to spot the changes made by Ansible.

You should see something like this:
![image.png](../assets/image.png)


Why does this happen?

Due to idempotency. The Ansible Playbook can be run numerous times but only does it make a change the first time due to this being the only time that `node1` does not have the `myuser` user. Once the user is created, Ansible recognizes this and gives a status of *ok* letting us know that it's already there.

✅ Next Challenge
===
Press the `Check` button below to go to the next challenge once you’ve completed the task.

🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Writing+First+Playbook+slug+ID:+playbook-run-it&assignees=rlopez133)

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
