---
slug: testing-chenages-from-pr
id: gjg05xgj4vyf
type: challenge
title: Test the changes from PR locally
tabs:
- title: Terminal
  type: terminal
  hostname: shell
- title: VS Code
  type: service
  hostname: shell
  path: /editor/
  port: 80
difficulty: basic
timelimit: 600
---
Now, that we have checked out the pull request locally on a new branch `testing_PR1` let's try to run the `grant-access.yml` playbook again to see if the issue is fixed.

```
ansible-playbook grant-access.yml
```

From the output, it's clear that the playbook ran successfully and the changes from the pull request fixed the issue in `acl` module:

```
PLAY [Grant user Devops write access to a file] **********************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************
ok: [localhost]

TASK [ansible.drill.acl] *********************************************************************************************************************************************************
changed: [localhost]

PLAY RECAP ***********************************************************************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

As you have verified that the new code fixes the issue you can now try testing the pull requests in the same way and give feedback or the linked issue(s).