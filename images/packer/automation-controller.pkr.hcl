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
    default = "automation-controller"
}

variable "ansible_vars_file" {
    type    = string
    default = null
}

local "extra_args" {
    expression = var.ansible_vars_file != null ? ["-e", "@images/ansible/extra-vars.yml", "-e", "ansible_python_interpreter=/usr/bin/python3", "-e", var.ansible_vars_file] : ["-e", "@images/ansible/extra-vars.yml", "-e", "ansible_python_interpreter=/usr/bin/python3"]
}

source "googlecompute" "automation-controller" {
    project_id          = var.project_id
    source_image_family = "rhel-8"
    ssh_username        = "rhel"
    wait_to_add_ssh_keys = "60s"
    zone                = var.zone
    machine_type        = "n1-standard-2"
    image_name          = var.image_name
}


build {
    sources = ["sources.googlecompute.automation-controller"]

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
