---
slug: network-idempotency
id: 3xfk0jsfqejn
type: challenge
title: Validate idempotency
teaser: The best playbooks are idempotent playbooks
notes:
- type: text
  contents: |
    # More about Modules

    Modules do the actual work in Ansible, they are what gets executed in each playbook task.

    - Typically written in Python (but not limited to it)
    - Modules can be idempotent
    - Modules take user input in the form of parameters
- type: text
  contents: |
    # Network modules

    Ansible modules for network automation typically references the vendor OS followed by the module name.

    - `namespace.collection.facts`
    - `namespace.collection.command`
    - `namespace.collection.config`
    - `namespace.collection.resource`

    For example:
    - Arista EOS = `arista.eos.`
    - Cisco IOS/IOS-XE = `cisco.ios.`
    - Juniper Junos = `junipsnetworks.junos.`
- type: text
  contents: |-
    # Lets get started

    That is the end of of your lab briefing!

    Once the lab is setup you can click the Green start button <img src="https://github.com/IPvSean/pictures_for_github/blob/master/start_button.png?raw=true" width="100px" align="left"> in the bottom right corner of this window.
tabs:
- id: sqxvalcol6tn
  title: code-server
  type: service
  hostname: code-server
  path: /editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel
  port: 80
- id: vuztyx0sxai9
  title: terminal
  type: terminal
  hostname: code-server
difficulty: basic
timelimit: 600
---
Step 1 - Validate idempotency
===

The `cisco.ios.config` module is idempotent. This means, a configuration change is pushed to the device if and only if that configuration does not exist on the end hosts.

<table>
  <tr>
    <th>Need help with Ansible Automation terminology?</th>
  </tr>
  <tr>
    <td>Check out the <a href="https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html">glossary here</a> for more information on terms like idempotency.</td>
  </tr>
</table>

To validate the concept of idempotency, re-run the playbook:

```
ansible-navigator run playbook.yml --mode stdout
```

<table>
  <tr>
    <th>NOTE:</th>
  </tr>
  <tr>
    <td>See that the <b>changed parameter</b> in the <b>PLAY RECAP</b> indicates 0 changes.
</td>
  </tr>
</table>

Re-running the Ansible Playbook multiple times will result in the same exact output, with **ok=1** and **change=0**.

Unless another operator or process removes or modifies the existing configuration on rtr1, this Ansible Playbook will just keep reporting ok=1 indicating that the configuration already exists and is configured correctly on the network device.

Step 2 - Modify Ansible Playbook
===

Now update the task to add one more SNMP RO community string named ansible-test.

```
snmp-server community ansible-test RO
```

Use code-server to open the `playbook.yml` file to add the command:

Make sure to save the playbook.yml with the change.

Step 3 - Use check mode
===

This time however, instead of running the playbook to push the change to the device, execute it using the --check flag in combination with the -v or verbose mode flag:

```
ansible-navigator run playbook.yml --mode stdout --check -v
```

The `--check mode` in combination with the `--verbose` flag will display the exact changes that will be deployed to the end device without actually pushing the change. This is a great technique to validate the changes you are about to push to a device before pushing it.

Step 4 - Verify configuration is not present
===

Verify that the Ansible Playbook did not apply the ansible-test community. Login to `cisco` and check the running configuration on the Cisco IOS-XE device.

```
ssh cisco
show run | i snmp
```

The output should look like the following:
```
snmp-server community ansible-public RO
snmp-server community ansible-private RW
```

Step 5 - Re-run the Ansible Playbook
===

Finally re-run this playbook again without the -v or --check flag to push the changes.

```
ansible-navigator run playbook.yml --mode stdout
```

Step 6 - Verify Config is present
===

```
ssh cisco
```

Feel free to cut and paste the following command.

```
sh run | i snmp
```

The output should look like the following:

```
snmp-server community ansible-public RO
snmp-server community ansible-private RW
snmp-server community ansible-test RO
```


Takeaways
===

- The config (e.g. `cisco.ios.config`) modules are idempotent, meaning they are stateful
- **check mode** ensures the Ansible Playbook does not make any changes on the remote systems
- **verbose mode** allows us to see more output to the terminal window, including which commands would be applied
- This Ansible Playbook could be scheduled in **Automation controller** to enforce the configuration. For example this could mean the Ansible Playbook could be run once a day for a particular network. In combination with **check mode** this could just be a read only Ansible Playbook that sees and reports if configuration is missing or modified on the network.

# Complete