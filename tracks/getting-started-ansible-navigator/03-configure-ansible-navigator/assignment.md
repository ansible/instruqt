---
slug: configure-ansible-navigator
id: hggv2ubzmllg
type: challenge
title: Configuring common ansible-navigator options
teaser: Let's take a look at common navigator settings!
notes:
- type: text
  contents: |-
    `ansible-navigator` has been introduced as a way to unify the development experience. For this reason, there are a lot of configration directives that can be customized for each developer/project.

    `ansible-navigator.yml` is the config file present in each project that will determine how automation is created and executed with `ansible-navigator`

    Let's take a look at some of these options.
tabs:
- title: code-server
  type: service
  hostname: code-server
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel
  port: 80
difficulty: basic
timelimit: 450
---
`ansible-navigator` has its own settings and can be configured on a per-project basis. This is useful if your projects span multiple execution environments, or require different ansible defaults, for example.

Additionally, developers can use these settings to adapt `ansible-navigator` to their development styles, code editor/IDE, etc..

Let's take a look at some of the common options.

**1.** In the directory `/home/rhel` you should see a file called `ansible-navigator.yml`. Open it up and check out the contents. Notice that there are currently some execution environment and logging settings already there.

Developers love the ability to not only run ansible-navigator within the integrated terminal, but I want to be able to pass task output back to my code editor for inspection.

**2.** `ansible-navigator` can configure a preferred editor for the `:open` sub-command. Let's do that now. Open `ansible-navigator.yml` and set your preferred editor to the code-server instance in your environment. Do this by copying the following settings to the end of the file:
```

  editor:
    command: code-server {filename}
    console: false
```

**3.** Execute your test playbook:
```
ansible-navigator run ./test.yml
```

**4.** Inspect the play by pressing <kbd>0</kbd>, inspect the first task by pressing <kbd>0</kbd> again and issue the subcommand `:open`.

You should now have a new tab within your code editor with the output of that task as the file contents. `:open` works for any page within the navigator TUI and can be useful in creating playbooks.