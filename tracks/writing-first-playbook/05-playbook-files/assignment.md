---
slug: playbook-files
id: ybwrhvtkop7p
type: challenge
title: 'Extend the playbook more: copy files'
teaser: 'Let''s do more with our automation: manage files!'
notes:
- type: text
  contents: Besides pure interactions on the target node there is also the possibility
    to copy data between the controlling instance and the managed nodes. The copy
    module can be used to transfer data.
tabs:
- title: control
  type: terminal
  hostname: control
- title: editor
  type: service
  hostname: control
  path: /editor/
  port: 443
difficulty: basic
timelimit: 600
---
In the editor, create a file directory `files` underneath the directory `ansible-files`. Inside the `files` directory, create a html file called `web.html` with the following content

```
<body>
<h1>Apache is running fine, thanks to Ansible!</h1>
</body>
```

Now go back to the file `apache.yml` and add a task to copy this file to the managed node:

```
  - name: copy web.html
    ansible.builtin.copy:
      src: web.html
      dest: /var/www/html/index.html
```

Note here that the source does not mention the directory `files`! The `files` directory is a default place that is searched for a given source automatically.

On the control host, change to the directory `ansible-files` execute the playbook again:

```
cd ansible-files
ansible-navigator run apache.yml -i hosts
```

As you can verify, the file is deployed by ssh into node1 using curl command.

```
curl http://node1
```