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
      playbook_file = "images/ansible/workshop-collection-install.yml"
      user = "rhel"
      inventory_file_template = "controller ansible_host={{ .Host }} ansible_user={{ .User }} ansible_port={{ .Port }}\n"
      extra_arguments = [ "-e", "@images/ansible/extra-vars.yml" ]
    }

    provisioner "ansible" {
      command = "ansible-playbook"
      playbook_file = "images/ansible/controller-setup.yml"
      user = "rhel"
      inventory_file_template = "controller ansible_host={{ .Host }} ansible_user={{ .User }} ansible_port={{ .Port }}\n"
      extra_arguments = [ "-e", "@images/ansible/extra-vars.yml" ]
    }

}
