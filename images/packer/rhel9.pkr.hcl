variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

source "googlecompute" "ansible" {
    project_id          = var.project_id
    source_image_family = "rhel-9"
    ssh_username        = "rhel"
    zone                = "us-east1-d"
    machine_type        = "n2-standard-2"
    image_name          = "rhel9"
}

build {
    sources = ["sources.googlecompute.ansible"]

    provisioner "shell" {
        inline = ["sudo dnf -y update"]
    }

    provisioner "ansible" {
        playbook_file = "${path.root}/../ansible/rhel-setup.yml"
        user = "rhel"
        use_proxy = false
    }
}
