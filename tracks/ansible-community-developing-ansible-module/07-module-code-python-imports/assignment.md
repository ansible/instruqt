---
slug: module-code-python-imports
id: xr3x78axvxh3
type: challenge
title: Module Code and Python Imports
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
So far we added the shebang, UTF-8 coding, copyright line, license, and the sections for DOCUMENTATION, EXAMPLES, and RETURN to the my_test.py module file. After all that, you can add the python imports.

Python imports should be defined in this format `from ansible.module_utils.basic import AnsibleModule` for every module that is written for Ansible.

Copy the below module code in my_test.py file after the RETURN block:

```
vim ~/ansible_collections/example_ns/example_collection/plugins/modules/my_test.py
```

Note: Turn on `paste` mode in vim by typing `:set paste`, press `i` and then paste the below text to avoid indendation errors.

```python
from ansible.module_utils.basic import AnsibleModule

def run_module():

    module_args = dict(
        name=dict(type='str', required=True),
        new=dict(type='bool', required=False, default=False)
    )

    result = dict(
        changed=False,
        original_message='',
        message=''
    )

    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True
    )

    if module.check_mode:
        module.exit_json(**result)

    result['original_message'] = module.params['name']
    result['message'] = 'goodbye'

    if module.params['new']:
        result['changed'] = True

    if module.params['name'] == 'fail me':
        module.fail_json(msg='You requested this to fail', **result)

    module.exit_json(**result)


def main():
    run_module()


if __name__ == '__main__':
    main()
```

Save and exit `Vim` editor by typing `:wq`.

To understand each and every line of the above module code, read the comments in the python code from the example [here](https://github.com/ansible/ansible/blob/devel/examples/scripts/my_test.py).
