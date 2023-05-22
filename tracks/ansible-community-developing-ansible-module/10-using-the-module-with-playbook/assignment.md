---
slug: using-the-module-with-playbook
id: jobgag60vz1t
type: challenge
title: Using the new module in Ansible
teaser: '#'
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
timelimit: 400
---
As the `my_test` module is ready, it can be used with `ansible` and `ansible-playbook` executable binaries.

Include `~/ansible_collections` to collections path.

```
export ANSIBLE_COLLECTIONS_PATH=~/ansible_collections
```

Refer to the [Ansible documentation](https://docs.ansible.com/ansible/devel/reference_appendices/config.html#collections-paths) for details.

Activate the virtual environment and then execute the environment setup script from the root of the Ansible repo.

```
. ~/ansible/ansible-venv/bin/activate && . ~/ansible/hacking/env-setup
```

Run Ansible Ad-hoc command and call the `example_ns.example_collection.my_test` module like below:

```
ansible localhost -m example_ns.example_collection.my_test -a "name='hello' new=true"
```

```
localhost | CHANGED => {
    "changed": true,
    "message": "goodbye",
    "original_message": "hello"
}
```

The above output confirms that the command ran successfully.

To call a module from inside a collection in playbook, you can directly use the `FQCN` (Fully Qualified Collection Name) which is a recommended way or you can use `collections` playbook keyword and then call the modules with short names.

See [Using collections in a Playbook](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html#using-collections-in-a-playbook) for more details.

## Congratulations!

You developed a basic Ansible module with understanding of the required Ansible format and documentation, a simple argument spec for declaring the module options.

See the [programming tips](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_best_practices.html#developing-modules-best-practices) and [Python 3 compatibility](https://docs.ansible.com/ansible/latest/dev_guide/developing_python_3.html#developing-python-3) pages for pointers on writing clean and concise module code.

## Your feedback matters!

Hope you found this track useful. We are always looking for ways to improve, let us know what you think by posting your comments on the GitHub discussion [here](https://github.com/ansible/instruqt/discussions/54).