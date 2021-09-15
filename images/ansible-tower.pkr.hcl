variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

source "googlecompute" "ansible-tower" {
    project_id          = var.project_id
    source_image_family = "rhel-8"
    ssh_username        = "rhel"
    zone                = "us-east1-d"
    machine_type        = "n1-standard-2"
    image_name          = "ansible-tower"
}


build {
    sources = ["sources.googlecompute.ansible-tower"]

    provisioner "file" {
        source = "ansible/inventory"
        destination = "/tmp/inventory"
    }

    provisioner "file" {
        source = "ansible/tower_license.json"
        destination = "/tmp/license"
    }

    provisioner "ansible" {
      playbook_file = "./ansible/tower-setup.yml"
  user = "rhel"
  extra_arguments = [ "-vvvv" ]
    }

}
