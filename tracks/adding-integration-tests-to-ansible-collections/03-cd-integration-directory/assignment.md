---
slug: cd-integration-directory
id: nsynktrioxvc
type: challenge
title: Create directory structure for integration tests
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
You must place integration tests in the appropriate tests/integration/targets/ directory.

We will start with creating a setup target that will install all required packages and will run PostgreSQL service.

Change directory to Collection path:

```
cd ~/ansible_collections/community/postgresql/
```

Create the following directories:

```
mkdir -p tests/integration/targets/setup_postgresql_db/tasks
```

Create tests/integration/targets/setup_postgresql_db/tasks/main.yml and copy paste the below:

```
vim tests/integration/targets/setup_postgresql_db/tasks/main.yml
```

Note: Turn on `paste` mode in vim by typing `:set paste` and then paste the below text to avoid indendation errors.

```yaml
- name: Install required packages
  package:
    name:
      - apt-utils
      - postgresql
      - postgresql-common
      - python3-psycopg2

- name: Initialize PostgreSQL
  shell: . /usr/share/postgresql-common/maintscripts-functions && set_system_locale && /usr/bin/pg_createcluster -u postgres 12 main
  args:
    creates: /etc/postgresql/12/

- name: Start PostgreSQL service
  service:
    name: postgresql
    state: started
```