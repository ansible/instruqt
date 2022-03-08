variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

variable "zone" {
    type    = string
    default = "us-east1-d"
}

variable "image_name" {
    type    = string
    default = "ansible"
}

variable "ansible_extra_args" {
    type    = string
    default = ""
}

source "googlecompute" "ansible" {
    project_id          = var.project_id
    source_image        = "rhel8"
    ssh_username        = "rhel"
    zone                = var.zone
    machine_type        = "n1-standard-2"
    image_name          = var.image_name
}

build {
    sources = ["sources.googlecompute.ansible"]
    provisioner "ansible" {
        playbook_file = "${path.root}/ansible/ansible-setup.yml"
        user = "rhel"
        extra_arguments = ["-e", "@images/ansible/extra-vars.yml", "-e", "ansible_python_interpreter=/usr/bin/python3", var.ansible_extra_args]
    }
}
