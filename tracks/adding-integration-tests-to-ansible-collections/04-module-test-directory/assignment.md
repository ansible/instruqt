---
slug: module-test-directory
id: qrchjl6ugo0o
type: challenge
title: Writing Integration Tests for postgresql_info module
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
timelimit: 600
---
For module integration tests, you can use the module name alone. For example, you would place integration tests for `plugins/modules/postgresql_info.py` in a directory called `tests/integration/targets/postgresql_info/`.

Change directory to collection path:

```
cd ~/ansible_collections/community/postgresql/
```

Create the following directories for the `postgresql_info` target:

~~~
mkdir -p tests/integration/targets/postgresql_info/tasks tests/integration/targets/postgresql_info/meta
~~~

To make the setup_postgresql_db target running before the postgresql_info target as a dependency, create the tests/integration/targets/postgresql_info/meta/main.yml and add the following code to it:

```
vim tests/integration/targets/postgresql_info/meta/main.yml
```

Note: Turn on `paste` mode in vim by typing `:set paste` and then paste the below text to avoid indendation errors.

```
dependencies:
  - setup_postgresql_db
```

Now we are ready to add our first test task for the `postgresql_info` module.

Create the tests/integration/targets/postgresql_info/tasks/main.yml file and add the following code to it:

```
vim tests/integration/targets/postgresql_info/tasks/main.yml
```

```
- name: Test postgresql_info module
  become: yes
  become_user: postgres
  postgresql_info:
    login_user: postgres
    login_db: postgres
  register: result

- name: Check the module returns what we expect
  assert:
    that:
      - result is not changed
      - result.version.major == 12
      - result.version.minor == 8
```

In the first task, we run the postgresql_info module to fetch information from the database we installed and ran with the setup_postgresql_db target. We save values returned by the module into the result variable.

In the second task, we check with the assert module what our task returns. We expect that, among other things, it returns the server version and reports that the system state has not been changed.
