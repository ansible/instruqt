---
slug: using-modules-in-playbook
id: 54zhy0loy2wk
type: challenge
title: Using the Module in a playbook
teaser: '#'
tabs:
- title: shell
  type: terminal
  hostname: shell
difficulty: basic
timelimit: 600
---
To call a module from inside a collection in playbook, you can directly use the `FQCN` (Fully Qualified Collection Name) which is a recommended way or you can use `collections` playbook keyword and then call the modules with short names.

Create a playbook `configure_timezone.yml`

```
vim ~/configure_timezone.yml
```

Copy paste the below content:

Note: Turn on `paste` mode in vim by typing `:set paste`, press `i` and then paste the below text to avoid indendation errors.

```
---
- name: Change Timezone to Europe/Paris
  hosts: localhost
  become: true
  connection: local
  tasks:
    - name: Change TZ
      community.clock.timezone:
        name: Europe/Paris

- name: Change Timezone to Europe/Paris
  hosts: localhost
  connection: local
  collections:
    - community.clock
  tasks:
    - name: Change TZ
      timezone:
        name: Europe/Paris
```

The above playbook consists of two plays. The first play uses FQCN to call a module and the second uses collections keyword.

Now execute the playbook.

```
ansible-playbook configure_timezone.yml
```

```
PLAY RECAP **************************************************************************************************************************
localhost                  : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

The above output confirms that the playbook ran successfully.

Also, you can verify the system timezone settings by executing `timedatectl` command:

```
timedatectl status

      Local time: Wed 2021-04-14 14:25:21 CEST
  Universal time: Wed 2021-04-14 12:25:21 UTC
        RTC time: Wed 2021-04-14 14:25:20
       Time zone: Europe/Paris (CEST, +0200)
     NTP enabled: yes
NTP synchronized: yes
 RTC in local TZ: yes
      DST active: yes
 Last DST change: DST began at
                  Sun 2021-03-28 01:59:59 CET
                  Sun 2021-03-28 03:00:00 CEST
 Next DST change: DST ends (the clock jumps one hour backwards) at
                  Sun 2021-10-31 02:59:59 CEST
                  Sun 2021-10-31 02:00:00 CET
```

See [Using collections in a Playbook](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html#using-collections-in-a-playbook) for more details.