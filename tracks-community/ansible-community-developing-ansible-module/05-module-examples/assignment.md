---
slug: module-examples
id: igxyntqt0u6j
type: challenge
title: Module Examples
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
timelimit: 300
---
After the DOCUMENTATION block comes the EXAMPLE block. This block contains examples of how the module works and how to use them inside the playbook. EXAMPLE block is written in multi-line plain-text YAML format.

Open `my_test.py` and copy the below code after DOCUMENTATION block:

```
vim ~/ansible_collections/example_ns/example_collection/plugins/modules/my_test.py
```

Note: Turn on `paste` mode in vim by typing `:set paste`, press `i` and then paste the below text to avoid indendation errors.

~~~
EXAMPLES = r'''
# Pass in a message
- name: Test with a message
  my_namespace.my_collection.my_test:
    name: hello world

# pass in a message and have changed true
- name: Test with a message and changed output
  my_namespace.my_collection.my_test:
    name: hello world
    new: true

# fail the module
- name: Test failure of the module
  my_namespace.my_collection.my_test:
    name: fail me
'''
~~~

Save and exit `Vim` editor by typing `:wq`.

If your module supports check mode or diff mode then you can specify them in the example block.

For more details on how to write EXAMPLE block in module file can be found [here](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_documenting.html#examples-block).
