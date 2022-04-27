---
slug: ansible-navigator-using-execution-environments
id: dilqtnpyq0ye
type: challenge
title: Using execution environments
teaser: Configure navigator to use an execution environment
notes:
- type: text
  contents: |-
    When it's time to share the playbooks you have written on your local workstation, how do you communicate the dependencies (collections, roles, modules, python packages, system packages, etc.) to your teammates who will run these playbooks?

    This is where execution environments come in! Execution environment images bundle all necessary dependencies into container images that can be easily shared so that automation executes reliably everywhere.

    Ansible Navigator is built to use these execution environments together with playbooks you create.
tabs:
- title: code-server
  type: service
  hostname: code-server
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel
  port: 80
difficulty: basic
timelimit: 450
---
Up to this point, `ansible-navigator` has been running with just the built in modules and executing without an execution environment.

Let's see what happens when we change `ansible-navigator.yml` to use the default execution environment.

**1.** Open `ansible-navigator.yml` and change `enabled: false` to `enabled: true` under the `execution-environment` settings block. The file should look like this:
```
---
ansible-navigator:
  execution-environment:
    container-engine: podman
    image: ee-supported-rhel8:2.0.0
    enabled: true
    pull-policy: never

  playbook-artifact:
    save-as: /home/rhel/playbook-artifacts/{playbook_name}-artifact-{ts_utc}.json

  logging:
    level: debug

  editor:
    command: code-server {filename}
    console false
```

**2.** Re-reun your test playbook:
```
ansible-navigator run ./test.yml
```

Notice that `ansible-navigator` knows that it should be using an execution environment but none are currently present. You should see a pull process happening now where an execution environment is being pulled from container registry. `ansible-navigator` can be configured in the same yaml file to pull from your own Private Automation Hub.

**3.** Your `test.yml` file should have executed successfully. You can now use `ansible-navigator` to inspect this execution environment by issuing the `:collections` subcommand.

**4.** While inspecting collections, there is a module in the `ansible.utils` collection called `fact_diff`. Locate the author of this module and remember the github handle associated with this person.