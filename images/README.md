# Images for Instruqt

## Notes:
The machine generating the images must be configured with google cloud console + an app specific password before running packer builds. In the future, we may not depend on packer preferring ansible as a use case for automating the managemen of cloud images, but this can be implemented later. Also, when generating windows images from macos, there's an env var that needs to be set in your active shell: `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`

## Instruqt environment details

Instruqt handles ssh key management for all nodes so `node1-$ ssh node2` should just work. There is currently no shell for Windows hosts but the windows image configured from this repo installs ssh. The short name defined in the environment for your VM is the hostname used to connect through ssh. 

## Image details

Image name | Description | connection | usage in challenge
--- | --- | --- | ---
`ansible` | Ansible on RHEL 8 | ssh keys already there | 
`ansible-tower` | Ansible Tower on RHEL 8<br>VS Code included | **Tower** user/pass: `admin/ansible123!` <br>**VS Code** pass: `ansible123!` | **Tower** `type: service`,  `path: `,  `port: 443` <br> **VS Code** `type: service`,  `path: /editor/`,  `port: 443`
`windows` | Windows 2016 | admin/Password123

**Packer recipe for Ansible Tower image**

This needs a `ansible/tower_license.json` file, which is excluded from this repo.

## Setup-scripts

Everything contained in `ansible/setup-scripts` will be copied to the tmp dir on Tower when the image is built. These scripts are used to configure Tower for that particular exercise (e.g. remove all non windows modules from the adhoc drop down for windows tracks). Unfortunately, just dropping the playbooks into the challenge directory for that track and then running `ansible-playbook` from the bash script doesn't do it. This is temporary until figuring out something more elegant.
