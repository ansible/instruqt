---
slug: verify-and-test-module-code
id: ln9zz5ffqw0d
type: challenge
title: Verify and Test the Module code
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
The my_test.py module accepts two arguments and to test if the code accepts and parses the arguments we’ll create an argument file and pass it to the module.

Create `args.json` under `tmp` directory and add the below content:

```
vim /tmp/args.json
```

Note: Turn on `paste` mode in vim by typing `:set paste`, press `i` and then paste the below text to avoid indendation errors.

~~~
{
    "ANSIBLE_MODULE_ARGS": {
        "name": "hello",
        "new": true
    }
}
~~~

Note: Before executing the module code locally make sure to activate the Python virtual environment and then run the environment setup script from the root of the Ansible repo.

```
. ~/ansible/ansible-venv/bin/activate && . ~/ansible/hacking/env-setup
```

Test `my_test` module by running it locally using python:

```
cd ~/ansible_collections/example_ns/example_collection/plugins/modules/
```

~~~
python -m my_test /tmp/args.json
~~~

The below output verifies that my_test module accepts and returns arguments:

~~~
{"changed": true, "state": {"original_message": "hello", "new_message": "goodbye"}, "invocation": {"module_args": {"name": "hello", "new": true}}}
~~~

Now, you’re all set to use the module with `ansible` & `ansible-playbook` binaries and can use the `my_test` sample module code to write your own module.
