# Images for Instruqt

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

The idea here is that we can cut down on image configuration by configuring the instance for each track using ansible. The downside, if there's a lot of instance configuration needed, the startup time will suffer.

## Building images

The cloud of choice for Instruqt is GCP. Images are currently built on GCP using Packer. Install packer and gcloud on your workstation. You should now be able to login to gcloud using something like `gcloud auth application-default login`. [More info on GCP auth](https://cloud.google.com/sdk/gcloud/reference/auth/application-default). 

Take a look at the packer files `*.pkr.hcl` for current images to get an idea of what is going on. Once your build file has been customized for your use case run `packer build your-image.pkr.hcl`. If your image already exists within the GCP project specified in the packer file, you can force the refresh of the image like so: `packer build --force your-image.pkr.hcl`

When creating a new track, you should be able to specify the path the new image using `project-name/image-name`

## Notes:
When generating windows images from macos, there's an env var that needs to be set in your active shell: `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`
