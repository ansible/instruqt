vs_code
=========

Installs and configures TigerVNC server for user with a Gnome xsession.
Role Variables
--------------

vnc_username: student
vnc_password: learn_ansible
vnc_gnome_session: gnome-classic

Example Playbook
----------------

```yaml
    - hosts: servers
      vars:
        vnc_username: student
        vnc_password: learn_ansible
        vnc_gnome_session: gnome-classic
      roles:
         - vs_code
```
