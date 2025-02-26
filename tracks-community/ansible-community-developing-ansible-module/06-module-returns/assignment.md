---
slug: module-returns
id: lcmw6k7zwhf7
type: challenge
title: Module returns for use by other modules
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
RETURN block comes after the DOCUMENTATION and EXAMPLE block. This block contains the information about the module returns for use by other modules.

Copy the below code into `my_test.py` file after the EXAMPLE block:

```
vim ~/ansible_collections/example_ns/example_collection/plugins/modules/my_test.py
```

Note: Turn on `paste` mode in vim by typing `:set paste`, press `i` and then paste the below text to avoid indendation errors.

~~~
RETURN = r'''
# These are examples of possible return values, and in general should use other names for return values.
original_message:
    description: The original name param that was passed in.
    type: str
    returned: always
    sample: 'hello world'
message:
    description: The output message that the test module generates.
    type: str
    returned: always
    sample: 'goodbye'
'''
~~~

Save and exit `Vim` editor by typing `:wq`.

If your module doesn’t return anything (apart from the standard returns), this section of your module should read: RETURN = r''' # ''' Otherwise, for each value returned, provide the fields that are mentioned in the doc [here](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_documenting.html#return-block).
