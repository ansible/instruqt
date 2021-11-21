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
    default = "automation-mesh"
}

source "googlecompute" "automation-mesh" {
    project_id          = var.project_id
    source_image_family = "rhel-8"
    ssh_username        = "rhel"
    zone                = var.zone
    machine_type        = "n1-standard-2"
    image_name          = var.image_name
}


build {
    sources = ["sources.googlecompute.automation-mesh"]

    provisioner "ansible" {
      playbook_file = "./ansible/controller-setup.yml"
      user = "rhel"
      extra_arguments = [ "-vvv" ]
    }

}
