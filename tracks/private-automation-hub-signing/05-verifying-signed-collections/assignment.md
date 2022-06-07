---
slug: verifying-signed-collections
id: mchcohzehvll
type: challenge
title: 'Bonus Exercise: Verifying the signed content collections using the ansible-galaxy
  CLI'
teaser: Let's verify the signed collection by using the `ansible-galaxy` CLI
notes:
- type: text
  contents: '#### Bonus Exercise: ***Verifying the signed*** content collections using
    the ansible-galaxy CLI'
tabs:
- title: automationhub-terminal
  type: terminal
  hostname: privatehub-01
difficulty: basic
timelimit: 300
---
You can also verify a signed collection by comparing it with its version on private automation hub instance using the `--keyring` option in `ansible-galaxy` CLI and signatures.
We will try to tamper our signed collection and then we will verify it by using the `ansible-galaxy collection verify` subcommand.
## 1. Add a new empty plugin to the signed collection `community.lab_collection`
Run the following command:
```
touch ~/.ansible/collections/ansible_collections/community/lab_collection/docs/README.md
```

## 2. Verify the tampered collection
Run the following command:
```
ansible-galaxy collection verify community.lab_collection --keyring keyring.kbx -c
```
The command will do a comparison between the local version of the collection and remote version on private automation hub instance, the output will show which files have been changed/added/deleted.
Output with verbosity `-vvvv` will provide extra details
```
(exit code 0)
GnuPG signature verification succeeded, verifying contents of community.lab_collection:1.0.0
MANIFEST.json hash: f285e70041487374977afd4d1c7b917a6b15b52b340d66f513155417a8cb4e6b
Collection community.lab_collection contains modified content in the following files:
    docs/README.md
    Expected: the file does not exist
    Found: the file exists
```
***

This marks the completion of the content signing exercise. Click on **Next** to complete this exercise.
