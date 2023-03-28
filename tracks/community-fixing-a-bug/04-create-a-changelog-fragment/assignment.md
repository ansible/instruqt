---
slug: create-a-changelog-fragment
id: em4z7pcchcx2
type: challenge
title: Create a changelog fragment
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
Now add a changelog fragment file that describes the change performed, this file that will be included in the changelog file in the next release to provide to users of this collections changes done.

```
cd ansible_collections/community/mysql
```

```
vim changelogs/fragments/mysql_user_docs.yml
```

Note: Turn on `paste` mode in vim by typing `:set paste`, press `i` and then paste the below text to avoid indendation errors.

```
---
trivial:
  - mysql_user - fixed the module docs for the mysql_user module.
```

Save and exit Vim by typing `:wq`.
Finally, add the two files to git staging and commit the modification

```
git add changelogs/fragments/mysql_user_docs.yml plugins/modules/mysql_user.py
git commit -m "Fix mysql_user documentation"
```

More details regarding changelog fragments can be found in the [documentation](https://docs.ansible.com/ansible/latest/community/development_process.html#changelogs).
