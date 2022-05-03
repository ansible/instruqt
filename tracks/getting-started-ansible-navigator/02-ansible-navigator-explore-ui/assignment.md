---
slug: ansible-navigator-explore-ui
id: cjpyrstazxxx
type: challenge
title: Exploring the ansible-navigator interface
teaser: This challenge will explore the [`ansible-navigator`](https://github.com/ansible/ansible-navigator)
  user interface
notes:
- type: text
  contents: |-
    # The *ansible-navigator* interface
    <br><br>
    ### Improved developer experience
    --------
    [`ansible-navigator`](https://github.com/ansible/ansible-navigator) provides a context-aware user interface improving the development and testing experience for creators. It offers integration with Ansible documentation, IDEs (e.g. VScode) and a more prescriptive approach to creating automation
    <br><br>
    ## Enhanced navigation
    ---------------
    [`ansible-navigator`](https://github.com/ansible/ansible-navigator) makes it easier to navigate and filter through playbook outputs.
tabs:
- title: code-server
  type: service
  hostname: code-server
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel
  port: 80
difficulty: basic
timelimit: 450
---
# [`ansible-navigator`](https://github.com/ansible/ansible-navigator)
<br>

In this challenge, we'll explore the [`ansible-navigator`](https://github.com/ansible/ansible-navigator) interface and highlight new features.

**1.** First, run `ansible-navigator` with no additional options:
```
ansible-navigator
```

Now that you are in the `ansible-navigator` TUI, there are many sub-commands available to help in developing, testing and inspecting your local environment. By default, the `:welcome` subcommand has already been issued which shows a quick overview of available subcommands. Run `:help` to see more info.

**2.** Try out the subcommand for displaying documentation of the ping module by issuing the following command in `ansible-navigator`:
```
:doc ping
```

You can exit the ansible-navigtor TUI by issuing the `:quit` command.

**3.** Run your simple playbook again to ping localhost, but this time leave off the `-m stdout` option:
```
ansible-navigator run ./test.yml
```
You can also run playbooks from within the ansible-navigator TUI by simply issuing the run command with path to playbook: `:run ./test.yml`

In general, navigating `ansible-navigator` is done by using the number keys to select an option and the <kbd>Esc</kbd> key to go to the previous screen.

**4.** Explore the play that was run by pressing the number corresponding to that line. You should be taken to the next screen that will contain a list of the tasks that ran as a part of that play. Inspect the tasks by pressing the number of the corresponding line.

***
*Wondering how to select a line with a number greater than 9?* Simply prepend the number with a colon. Example: To select line 15, you would issue the command `:15`.
***

**5.** Select the gather_facts task by pressing <kbd>0</kbd> and issue the subcommand `:doc`

Using `ansible-navigator` is very helpful for quickly referencing documentation for specific tasks while debugging playbooks.

**6.** Finally, you can pass subcommands directly to `ansible-navigator` on the command line. Try getting docs on with `setup` module:
```
ansible-navigator doc setup
```

<br>

***
Remember, if you ever get stuck in `ansible-navigator`, <kbd>Esc</kbd> will always bring you to the previous screen. Pressing <kbd>Esc</kbd> when there are no more screens left will exit `ansible-navigator`.