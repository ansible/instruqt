---
slug: run-integration-tests
id: ncixnpax0yim
type: challenge
title: Running Integration Tests
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
To run integration tests for a collection you'll have to use `ansible-test` binary.

`ansible-test` is distributed as part of the ansible-core (and therefore ansible) package.

`ansible-test` supports three types of tests:

- Sanity
- Unit
- Integration

You must always execute `ansible-test` from the root directory of a collection.

Although these tests may run automatically when sending a pull request (PR), we should run them locally to catch errors before sending new commits for review.

For this example we will be running the Integration Tests in the Ubuntu 20.04 docker container using `ansible-test, by doing:

```
cd ~/ansible_collections/community/postgresql/
```

```
sudo ansible-test integration postgresql_info --docker ubuntu2004 -v
```

We prefer to run the tests in Docker as it ensures all test dependencies are installed, and nothing pollutes the host operating system.

Note: You can specify multiple target names. Each target name is the name of a directory in `tests/integration/targets/`.

The tests should pass. If we look at the output, we should see something like the following:

~~~
TASK [postgresql_info : Check the module returns what we expect] ***************
ok: [testhost] => {
  "changed": false,
  "msg": "All assertions passed"
}
~~~

If your tests fail when you are working on your project. Examine the output to see at which step the failure occurred. Investigate the issue, try fixing it, and run again. Repeat the cycle until the test passes.

## Congratulations!

You added a integration test for `community.postgresql.postgresql_info` module.

See [Testing collections](https://docs.ansible.com/ansible/devel/dev_guide/developing_collections_testing.html#testing-collections) and [Adding integration tests](https://docs.ansible.com/ansible/devel/dev_guide/developing_collections_testing.html#adding-integration-tests) pages for pointers on testing your collection and ensure that your code works well and integrates well with the rest of the Ansible ecosystem.