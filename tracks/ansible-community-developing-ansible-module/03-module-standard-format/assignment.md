---
slug: module-standard-format
id: 5nskdvyqbomy
type: challenge
title: Module Standard Format
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
Let’s begin with developing the Ansible module.

If you want to contribute your module to most Ansible collections, you must write your module in Python and follow the standard format described in this [link](https://docs.ansible.com/ansible/devel/dev_guide/developing_modules_documenting.html#module-format-and-documentation).

Start by adding `#!/usr/bin/env python` to the my_test.py module file. This “shebang” allows `ansible_python_interpreter` to work.

```
cd ~/ansible_collections/example_ns/example_collection/plugins/modules
```

```
vim my_test.py
```

Follow the shebang immediately with `# -*- coding: utf-8 -*-` to clarify that the file is UTF-8 encoded.

Now, add a copyright line with the original copyright holder and a license declaration.

Note: There are other types of license's available but for now we are using GNU GPL.

~~~
#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Copyright: (c) 2018, Your Name <your.name@example.org>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
~~~

Module file `my_test.py` should look like the above.