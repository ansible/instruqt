variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

variable "zone" {
    type    = string
    default = "us-east1-b"
}

variable "image_name" {
    type    = string
    default = "automation-controller9"
}

variable "ansible_vars_file" {
    type    = string
    default = null
}

local "extra_args" {
    expression = var.ansible_vars_file != null ? ["-e", "@${path.root}/../ansible/extra-vars.yml", "-e", "ansible_python_interpreter=/usr/bin/python3", "-e", var.ansible_vars_file] : ["-e", "@${path.root}/../ansible/extra-vars.yml", "-e", "ansible_python_interpreter=/usr/bin/python3"]
}

#/Users/sean/Documents/GitHub/instruqt/images/packer/images/ansible/extra-vars.yml

source "googlecompute" "automation-controller9" {
    project_id          = var.project_id
    source_image_family = "rhel-9"
    ssh_username        = "rhel"
    zone                = "us-east1-c"
    machine_type        = "n2-standard-2"
    image_name          = var.image_name
}

build {
    sources = ["sources.googlecompute.automation-controller9"]

    provisioner "ansible" {
      command = "ansible-playbook"
      playbook_file = "${path.root}/../ansible/workshop-collection-install.yml"
      user = "rhel"
      inventory_file_template = "controller ansible_host={{ .Host }} ansible_user={{ .User }} ansible_port={{ .Port }}\n"
      extra_arguments = local.extra_args
      use_proxy = false
    }

    provisioner "ansible" {
      command = "ansible-playbook"
      playbook_file = "${path.root}/../ansible/controller-setup.yml"
      user = "rhel"
      inventory_file_template = "controller ansible_host={{ .Host }} ansible_user={{ .User }} ansible_port={{ .Port }}\n"
      extra_arguments = local.extra_args
      use_proxy = false
    }
}
