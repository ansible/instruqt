variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

source "googlecompute" "ansible" {
    project_id          = var.project_id
    source_image_family = "rhel-8"
    ssh_username        = "rhel"
    zone                = "us-east1-d"
    machine_type        = "n1-standard-2"
    image_name          = "rhel8"
}

build {
    sources = ["sources.googlecompute.ansible"]

    provisioner "shell" {
        inline = ["sudo dnf -y update"]
    }

    provisioner "ansible" {
        playbook_file = "${path.root}/../ansible/rhel8-setup.yml"
        user = "rhel"
    }
}
