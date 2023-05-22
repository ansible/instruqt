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
`red-hat-mbu/automation-controller` [![controller build](https://github.com/ansible/instruqt/actions/workflows/controller-build.yml/badge.svg?branch=main)](https://github.com/ansible/instruqt/actions/workflows/controller-build.yml) | Automation controller on RHEL8 | `admin/ansible123!`<br>`student/learn_ansible` | n1-standard-4 | **Controller**: `type: service`, `port: 443`
`red-hat-mbu/arista-eos` | Arista EOS virtual switch | user / pass <br> `ansible` / `ansible123!` | `n1-standard-4` | *Terminal not supported yet. SSH from a linux node* |
`red-hat-mbu/cisco-ios-csr-1731` | Cisco IOS-XE virtual router | user / pass <br> `ansible` / `ansible123!` | `n1-standard-1` | *Terminal not supported yet. SSH from a linux node* |
`red-hat-mbu/windows` | Windows 2016 | SSH user/pass: `admin/Password123!` | `n1-standard-2` | *Terminal not supported yet. SSH from a linux node*
`red-hat-mbu/rhel8` [![rhel8 build](https://github.com/ansible/instruqt/actions/workflows/rhel8-build.yml/badge.svg?branch=main)](https://github.com/ansible/instruqt/actions/workflows/rhel8-build.yml)  | RHEL 8 latest | none | `n1-standard-2` | none. Proposed to be used as up2date base image.
`red-hat-mbu/mesh-node` | Mesh worker base image | SSH user/pass: `rhel/ansible123!` | n1-standard-2 | none
`red-hat-mbu/dublin-hop-image` | Mesh hop node | SSH user/pass: `rhel/ansible123!` | n1-standard-2 | none
`red-hat-mbu/jhb-exec-image` | Mesh execution node | SSH user/pass: `rhel/ansible123!` | n1-standard-2 | none
`red-hat-mbu/raleigh-controller` | Mesh controller node | SSH user/pass: `rhel/ansible123!` | n1-standard-4 | `type: service, port: 443`
`red-hat-mbu/devops-controller` | Pre-configured DevOps lab controller | Student SSH user/pass: `student/learn_ansible` | n1-standard-4 | `type: service, port: 443`

## Containers

Upstream container images can also be used. Please refer to the [Containers for Instruqt page](../containers/README.md)for examples.

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

Use the `ansible_vars_file` Packer variable to use Ansible variable files. Using external variable files helps prevent committing sensitive information into the repo. This variable is available in the  `automation-controller.pkr.hcl`, `ansible.pkr.hcl` and `mesh-node.pkr.hcl` packer build files. For example:

```packer build --force automation-controller.pkr.hcl -var ansible_vars_file="@<your_vars_file>"```

>**Note**<p>
> Your `extra_vars.yml` file contains sensitive information.<p>
> Ensure it's safe and excluded from repository pull requests and commits.<p>

### Example `extra_vars.yml` file

```yaml
# Extra vars example file for Instruqt automation mesh images

# Red Hat customer portal credentials
redhat_username: 'Your Red hat username'
redhat_password: 'Your Red Hat password'

# registry.redhat.io credentials
registry_username: 'Your registry username'
registry_password: 'Your registry password'

# access.redhat.com offline token. You can retrieve your token from https://access.redhat.com/management/api
offline_token: 'dswrfw8743rliuhfwiu444hweffw.....'
```

## Building automation controller

You are going to need two files in `instruqt/images/ansible`:

1. `offline_token.txt`

which is an offline token to download AAP from access.redhat.com.  This uses the `aap_download` role from the `ansible.workshops` collection.  You can retrieve the offline token from here: [https://access.redhat.com/management/api
](https://access.redhat.com/management/api)

2. `manifest.zip`

This is a license file to apply to AAP.  Please refer to this video by Colin McNaughton [https://www.youtube.com/watch?v=FYtilnsk7sM](https://www.youtube.com/watch?v=FYtilnsk7sM) to figure out how to get your manifest.zip

Place the `manifest.zip` in the `images\ansible` folder.

To execute packer run the following command->

```packer build --force automation-controller.pkr.hcl```

## Building automation mesh images

Automation mesh worker nodes are installed and configured during the automation controller installation. Due to this, building Instruqt images requires additional steps.

![mesh images](../assets/readme_mesh_images.png)

### Mesh file and directory structure

```text
.
├── images/
│   ├── ansible/
│   │   ├── templates/
│   │   │   └── "{{ track_slug }}"_inv.yml      # Automation controller installer inventory file to use during installation. Defaults to `
│   │   └── vars/
│   │       └── "{{ track_slug }}"_vars.yml     # Vars file is automatically included in mesh lab playbooks.
│   └── "{{ track_slug }}"_node-setup.yml       # Playbook used in mesh-node.pkr.hcl Packer file.
└── packer/
    └── mesh-node.pkr.hcl                       # Builds mesh node base image with "{{ track_slug }}"_node_setup.yml.
```

#### The track_slug variable

File lookups and naming conventions use the `track_slug` variable. Configure `track_slug` using the command line or the `TRACK_SLUG` environment variable.

##### Set the `TRACK_SLUG` environment variable

```bash
export TRACK_SLUG='getting-started-mesh'
```

##### Add it as an extra variable in `ansible-playbook` command

```bash
ansible-playbook mesh-lab-install.yml -e track_slug='getting-started-mesh'
```

##### Add it as an extra variable in `packer` command

```bash
packer build -force -var track_slug='getting-started-mesh' images/packer/mesh-node.pkr.hcl
```

### Mesh extra variables

Mesh node builds require additional variables to work and you can add them in multiple ways.

- `images/ansible/vars/"{{ track_slug }}_vars.yml` variables file. This file is imported in to mesh node Playbooks and Packer files.
- Packer `ansible_vars_file=@<your_vars_file>` variable. Useful to point variable files outside the repo
- Ansible playbook `-e @<your_vars_file>` argument. Useful to point variable files outside the repo.

Certain variables can optionally be configured using environment variables. This is generally more secure.

| **Ansible var**          | **Environment var**      |
|--------------------------|--------------------------|
| offline_token            | REDHAT_OFFLINE_TOKEN     |
| redhat_username          | REDHAT_USERNAME          |
| redhat_password          | REDHAT_PASSWORD          |
| gcp_service_account      | GCP_SERVICE_ACCOUNT      |
| gcp_service_account_file | GCP_SERVICE_ACCOUNT_FILE |
| gcp_project              | GCP_PROJECT              |
| gcp_zone                 | GCP_ZONE                 |

The example below from [getting-started-mesh_vars.yml](./ansible/vars/getting-started-mesh_vars.yml) provides a guide to set up your variable file.

```yaml
---
# Ansible config vars - the need for speed
ansible_ssh_pipelining: true
ansible_ssh_extra_args: '-o StrictHostKeyChecking=no -o ControlMaster=auto -o ControlPersist=60s'

# GCP vars
gcp_zone: "{{ lookup('ansible.builtin.env', 'GCP_ZONE', default='us-central1-a') }}"
gcp_project: "{{ lookup('ansible.builtin.env', 'GCP_PROJECT', default='red-hat-mbu') }}"
gcp_service_account_file: "{{ lookup('ansible.builtin.env', 'GCP_SERVICE_ACCOUNT_FILE') }}"
gcp_service_account: "{{ lookup('ansible.builtin.env', 'GCP_SERVICE_ACCOUNT') }}"
gcp_instances:
  - name: dublin-hop
    labels:
      role: "{{ track_slug }}"
      mesh-type: hop
      location: dublin
    machine_type: e2-standard-2
    network_interfaces:
      - access_configs:
        - name: External NAT # yamllint disable-line rule:indentation
          type: ONE_TO_ONE_NAT
    disks:
      - auto_delete: true
        boot: true
        device_name: dublin-hop
        initialize_params:
          source_image: "projects/{{ gcp_project }}/global/images/{{ track_slug }}-node"
          disk_size_gb: 20
          disk_type: pd-balanced
gcp_inventory_host_vars:
  ansible_user: rhel
  ansible_ssh_pass: ansible123!
  ansible_host_key_checking: false
  ansible_python_interpreter: /usr/bin/python3
```

### Building mesh labs

#### Step 1 - Create the mesh worker node base image using Packer

The base image is used to create mesh worker nodes during the controller install.

Run the following command from root repository folder. Optionally, point to external variable files using `-var mesh_extra_vars=@<your_vars_file>` and set the `track_slug` variable using `-var track_slug=<your_track_slug>`.

```bash
packer build --force -var -var track_slug=<your_track_slug> images/ansible/mesh-node.pkr.hcl
```

Here's an example used to create worker node base images for the `getting-started-mesh` lab.

```bash
packer build --force -var track_slug='getting-started-mesh' images/ansible/mesh-node.pkr.hcl
```

#### Step 2 - Run the `mesh-lab-install.yml` Ansible Playbook

The `mesh-lab-install.yml` Ansible playbook runs the AAP installer and configures mesh. The playbook performs the following tasks:

1. Creates GCP instances from their respective base images defined in the `gcp_instances` variable.
2. Installs automation controller with mesh worker nodes using `images/ansible/templates/{{ track_slug }}_inv.j2` inventory - e.g. `getting-started-mesh_inv.j2`
3. Creates new images based on `gcp_instances.name` variable and appends it with `-image` e.g. `dublin-hop-image`
4. Deletes unused instances
5. Makes a cup of coffee if you ask nicely.

Execute the following command in the `images\ansible` folder to build the base mesh worker node images. Optionally, point to external variable files using `-e  @<your_vars_file>`.

Set the `track_slug` variable using `-e track_slug=<your_track_slug>`.

Let's continue with the example in Step 1 used to create worker node base images for `getting-started-mesh`.

```bash
ansible-playbook mesh-lab-install.yml -e track_slug='getting-started-mesh'
```

<br>

# Words of wisdom from Colin & Craig

As a developer, I want to interact with GCP via gcloud, so I `gcloud auth login`

As a developer, I want my code to interact with GCP via SDK, so I `gcloud auth application-default login`

As a developer, I want to change my GCP project, so I `gcloud config set project <project_name>`

When generating windows images from macos, there's an env var that needs to be set in your active shell: `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES`

Want to open code-server with a specific working directory? In the tabs configuration of your challenge, use something like `/editor/?folder=vscode-remote%3A%2F%2F%2fhome%2Frhel` which would open code-server at with a CWD of `/home/rhel/`
