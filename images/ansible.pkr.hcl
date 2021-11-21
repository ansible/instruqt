variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

variable "image_name" {
    type    = string
    default = "ansible"
}
source "googlecompute" "ansible" {
    project_id          = var.project_id
    source_image_family = "rhel-8"
    ssh_username        = "rhel"
    zone                = "us-east1-d"
    machine_type        = "n1-standard-2"
    image_name          = var.image_name
}


build {
    sources = ["sources.googlecompute.ansible"]

    provisioner "ansible" {
        playbook_file = "./ansible/ansible-setup.yml"
        user = "rhel"
        extra_arguments = [ "-vvvv" ]
    }
}
