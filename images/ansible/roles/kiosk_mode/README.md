# Kiosk Mode Role

Installs a minimal Gnome desktop and a variety of GDM xsession options on RHEL 8 & 9 machines.The role creates a kiosk user,desktop icons, and configures Gnome settings.

## Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

## Role Variables

kiosk_username:
kiosk_script_file:
gnome_gsettings:
gnome_desktop_icons:
gnome_applications:

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
    - hosts: servers
      vars:
        kiosk_username: student

        kiosk_script_file: gnome-kiosk-script
        gnome_gsettings:
          - org.gnome.desktop.lockdown user-administration-disabled false
          - org.gnome.shell.extensions.desktop-icons show-mount false
          - org.gnome.shell.extensions.desktop-icons show-home false
          - org.gnome.shell.extensions.desktop-icons show-trash false
        gnome_desktop_icons:
          - code
          - firefox
        gnome_applications:
          - gnome-kiosk-script-session
      roles:
         - kiosk_mode
```
