---
slug: checkout-pr
id: ajnxsjxtpuyo
type: challenge
title: Checking out the pull request on a branch
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
A user named `test-ansible` has created a pull request to fix the `setfacl` command issue in `acl` module.

Now, let's get the pull request that resolves the `setfacl` error submitted by `test-ansible` user and check it out on a branch:

```
cd ~/ansible_collections/ansible/drill
```

Create and switch to a new branch named testing_PRXXXX, where the XXXX is the issue number associated with the pull request. For this course, we'll check this [pull request](https://github.com/ansible-collections/ansible.drill/pull/1) and the issue number is `1` hence the branch name will be `testing_PR1`:

```
git checkout -b testing_PR1
```

```
git pull https://github.com/test-ansible/ansible.drill test_pr_example
```

The above command pulls the new code from the `test-ansible` user feature branch into the newly created branch.

The output confirms that the code is fetched from the user’s feature branch successfully:

~~~
From https://github.com/test-ansible/ansible.drill
 * branch            test_pr_example -> FETCH_HEAD
Updating 065fe61..6392929
Fast-forward
 plugins/modules/acl.py | 1 +
 1 file changed, 1 insertion(+)
 ~~~