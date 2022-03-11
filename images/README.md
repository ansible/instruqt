# Images for Instruqt

Instruqt will use GCP images tied to your GCP account.  For the MBU our account is named "Red Hat MBU" (slug is `red-hat-mbu`).

To figure out the name of images check out this link:
[GCP Images](https://cloud.google.com/compute/docs/images#list_of_public_images_available_on)

Under **GCP Console -> Compute Engine -> Storage -> Images**

![screen shot](screen_shot_gcp_images.png)

## Image details

Image name | Description | connection | machine type | usage in challenge
--- | --- | --- | --- | ---
`red-hat-mbu/ansible` | cli Ansible on RHEL 8 | Root ssh keys already there<br>Able to SSH as user/pass: <br> `rhel` / `ansible123!` | `n1-standard-1` | `type: terminal`
`red-hat-mbu/automation-controller` [![controller build](https://github.com/ansible/instruqt/actions/workflows/controller-build.yml/badge.svg)](https://github.com/ansible/instruqt/actions/workflows/controller-build.yml) | Automation controller on RHEL8 | `admin/ansible123!` | n1-standard-4 | **Controller**: `type: service`, `port: 443`
`red-hat-mbu/arista-eos` | Arista EOS virtual switch | user / pass <br> `ansible` / `ansible123!` | `n1-standard-4` | *Terminal not supported yet. SSH from a linux node* |
`red-hat-mbu/cisco-ios-csr-1731` | Cisco IOS-XE virtual router | user / pass <br> `ansible` / `ansible123!` | `n1-standard-1` | *Terminal not supported yet. SSH from a linux node* |
`red-hat-mbu/windows` | Windows 2016 | SSH user/pass: `admin/Password123` | `n1-standard-2` | *Terminal not supported yet. SSH from a linux node*
`red-hat-mbu/rhel8` [![rhel8 build](https://github.com/ansible/instruqt/actions/workflows/rhel8-build.yml/badge.svg)](https://github.com/ansible/instruqt/actions/workflows/rhel8-build.yml)  | RHEL 8 latest | none | `n1-standard-2` | none
`red-hat-mbu/mesh-node` | Mesh worker base image | SSH user/pass: `rhel/ansible123!` | n1-standard-2 | none
`red-hat-mbu/mesh-hop1-mesh` | Mesh hop node | SSH user/pass: `rhel/ansible123!` | n1-standard-2 | none
`red-hat-mbu/mesh-exec1-mesh` | Mesh execution node | SSH user/pass: `rhel/ansible123!` | n1-standard-2 | none
`red-hat-mbu/automation-controller21-mesh` | Mesh execution node | SSH user/pass: `rhel/ansible123!` | n1-standard-4 | `type: service, port: 443`
## Setup-scripts

Everything contained in `ansible/setup-scripts` will be copied to the tmp dir on Tower when the image is built. These scripts are used to configure Tower for that particular exercise (e.g. remove all non windows modules from the adhoc drop down for windows tracks). Unfortunately, just dropping the playbooks into the challenge directory for that track and then running `ansible-playbook` from the bash script doesn't do it. This is temporary until figuring out something more elegant.

The idea here is that we can cut down on image configuration by configuring the instance for each track using ansible. The downside, if there's a lot of instance configuration needed, the startup time will suffer.

## Building images

The cloud of choice for Instruqt is GCP. Images are currently built on GCP using Packer. Install packer and gcloud on your workstation. You should now be able to login to gcloud using something like `gcloud auth application-default login`. [More info on GCP auth](https://cloud.google.com/sdk/gcloud/reference/auth/application-default).

Take a look at the packer files `*.pkr.hcl` for current images to get an idea of what is going on. Once your build file has been customized for your use case run `packer build your-image.pkr.hcl`. If your image already exists within the GCP project specified in the packer file, you can force the refresh of the image like so: `packer build --force your-image.pkr.hcl`

When creating a new track, you should be able to specify the path the new image using `project-name/image-name`

**High Level Diagram**:
![high level diagram picture](build_process.png)


## Extra vars file

The `ansible_vars_file` packer variable enables you to specify a file with additional Ansible variables. This variable is available in the  `automation-controller.pkr.hcl`, `ansible.pkr.hcl` and `mesh-node.pkr.hcl` packer build files. For example:

```packer build --force automation-controller.pkr.hcl -var ansible_vars_file="extra_vars.yml"```

>**Note**<p>
> Your `extra_vars.yml` file contains sensitive information.<p>
> Ensure it's safe and excluded from repository pull requests and commits.<p>
### Example `extra_vars.yml` file**

```
# Extra vars example file for Instruqt automation mesh images

# Red Hat customer portal credentials
redhat_username: 'Your Red hat username'
redhat_password: 'Your Red Hat password'

# registry.redhat.io credentials
registry_username: cbrandt1
registry_password: 'Eth@n2117'

# access.redhat.com offline token. You can retrieve your token from https://access.redhat.com/management/api
offline_token: 'dswrfw8743rliuhfwiu444hweffw.....'
```

## Building automation controller

You are going to need three files in `instruqt/images/ansible`:

1. `offline_token.txt`

which is an offline token to download AAP from access.redhat.com.  This uses the `aap_download` role from the `ansible.workshops` collection.  You can retrieve the offline token from here: [https://access.redhat.com/management/api
](https://access.redhat.com/management/api)


Create this file and it should be like this->

```
---
redhat_username: colin@redhat.com
redhat_password: "iLuvSean!"

```

3. `manifest.zip`

This is a license file to apply to AAP.  Please refer to this video by Colin McNaughton [https://www.youtube.com/watch?v=FYtilnsk7sM](https://www.youtube.com/watch?v=FYtilnsk7sM) to figure out how to get your manifest.zip

To execute packer run the following command->

```packer build --force automation-controller.pkr.hcl```

## Automation mesh images

Automation mesh worker nodes are installed and configured during the automation controller installation. Due to this, additional steps are needed when creating automation mesh Instruqt images.

![mesh images](../assets/instruqt_images.png)

### Building automation mesh images

The steps below create the following GCP images:

| Image name 	| Purpose 	| GCP Base image
|---	|---	| -- |
| mesh-exec1-mesh 	| Execution node 	| mesh-node |
| mesh-hop1-mesh 	| Hop node 	| mesh-node |
| automation-controller21-mesh 	| Automation controller with associated worker nodes 	| automation-controller |
| mesh-node | Worker node base image | None


This is a license file to apply to AAP.  Please refer to this video by Colin McNaughton [https://www.youtube.com/watch?v=FYtilnsk7sM](https://www.youtube.com/watch?v=FYtilnsk7sM) to figure out how to get your manifest.zip

Place the `manifest.zip` in the `images\ansible` folder.

**Required extra variables**

Please ensure the following Ansible variables are declared your `extra_vars.yml` file:
- redhat_username
- redhat_password
- registry_username
- registry_password
- offline_token

**`mesh-node` base image**

The mesh-node image is used to create the `mesh-hop1-mesh` and `mesh-exec1-mesh` images.

To build the base mesh worker node image, run the following command:

```packer build --force mesh-node.pkr.hcl -var ansible_vars_file=extra_vars.yml```

**Mesh worker node images**

The `mesh_lab_install.yml` playbook performs the following tasks:
1. Creates 3 GCP instances from their respective base images
2. Installs automation controller and associate worker nodes
3. Creates new images with a `-mesh` suffix. e.g. `mesh-hop1-mesh`
4. Deletes unused instances

Execute the following command in the `images\ansible` folder to build the mesh worker node images:

```ansible-playbook mesh_lab_install.yml -e @extra_vars.yml```

## Notes:
When generating windows images from macos, there's an env var that needs to be set in your active shell: `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`

Want to open code-server with a specific working directory? In the tabs configuration of your challenge, use something like `/editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel` which would open code-server at with a CWD of `/home/rhel/`
