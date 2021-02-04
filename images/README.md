# Images for Instruqt

## Notes:
The machine generating the images must be configured with google cloud console + an app specific password before running packer builds. In the future, we may not depend on packer preferring ansible as a use case for automating the managemen of cloud images, but this can be implemented later. Also, when generating windows images from macos, there's an env var that needs to be set in your active shell: `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`

## Image details

Image name | Description | connection
--- | --- | ---
`ansible` | Ansible on RHEL 8 | 
`ansible-tower` | Ansible Tower on RHEL 8 | admin/ansible123!
`windows` | Windows 2016 | admin/Password123

**Packer recipe for Ansible Tower image**

This needs a `ansible/tower_license.json` file, which is excluded from this repo.
