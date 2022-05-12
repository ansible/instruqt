---
slug: playbook-run-it
id: bxinuifc2aus
type: challenge
title: Run it!
teaser: See how it works!
notes:
- type: text
  contents: |-
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
difficulty: basic
timelimit: 300
---
Ansible Playbooks are executed using the ansible-navigator command on the control node. We also have to tell Ansible where to find the inventory. On the control host, change into the `ansible-files` directory using below command:

```
cd ansible-files
```

Now you should be ready to run your playbook:

```
ansible-navigator run apache.yml -i hosts
```

You might have to accept the SSH fingerprint during thist first connection to the host.

The output should not report any errors but provide an overview of the tasks executed and a play recap summarizing what has been done. There is also a task called “Gathering Facts” listed there: this is an built-in task that runs automatically at the beginning of each play. It collects information about the managed nodes. Exercises later on will cover this in more detail.

Connect to node1 via SSH to make sure Apache has been installed:

```
ssh node1
```

Use the command rpm -qi httpd to verify httpd is installed:

```
rpm -qi httpd
```

The output lists the name, version and other details about the package.

Run the Playbook a second time, and compare the output: The output changed from “changed” to “ok”, and the color changed from yellow to green. Also the “PLAY RECAP” is different now. This make it easy to spot what Ansible actually did.