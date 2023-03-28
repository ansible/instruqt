---
slug: module-documentation
id: uodr1y62zrxw
type: challenge
title: Module Documentation
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
Ansible’s online module documentation is generated from the `DOCUMENTATION` blocks in each module’s source code. The `DOCUMENTATION` block must be valid YAML. It comes immediately after the shebang, UTF-8 coding, copyright and license details.

Now, paste the below code into my_test.py module file.

```
vim ~/ansible_collections/example_ns/example_collection/plugins/modules/my_test.py
```

Note: Turn on `paste` mode in vim by typing `:set paste`, press `i` and then paste the below text to avoid indendation errors.

~~~
DOCUMENTATION = r'''
---
module: my_test
short_description: This is my test module
# If this is part of a collection, you need to use semantic versioning,
# i.e. the version is of the form "2.5.0" and not "2.4".
version_added: "1.0.0"
description: This is my longer description explaining my test module.
notes: This is a list which contains additional information that cannot be clubbed into any other parameter.
options:
    name:
        description: This is the message to send to the test module.
        required: true
        type: str
    new:
        description:
            - Control to demo if the result of this module is changed or not.
            - Parameter description can be a list as well.
        required: false
        type: bool
# Specify this value according to your collection
# in format of namespace.collection.doc_fragment_name
extends_documentation_fragment:
    - my_namespace.my_collection.my_doc_fragment_name
author:
    - Your Name (@yourGitHubHandle)
'''
~~~

Save and exit `Vim` editor by typing `:wq`.

From the above code, the `short_description` section contains the purpose of the module in one line and it’ll be displayed when the module is called using `ansible-doc -l` command.

You can add the detailed description under the `description` section.

If your module accepts arguments, then each one should be documented under the `options` section of the DOCUMENTATION block.

To know in depth about the documentation block and its field, refer to the documentation [here](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_documenting.html#documentation-block)
