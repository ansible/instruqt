variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

source "googlecompute" "automation-controller" {
    project_id          = var.project_id
    source_image_family = "rhel-8"
    ssh_username        = "rhel"
    zone                = "us-east4-c"
    machine_type        = "n1-standard-2"
    image_name          = "automation-controller"
}


build {
    sources = ["sources.googlecompute.automation-controller"]

    provisioner "file" {
        source = "ansible/inventory"
        destination = "/tmp/inventory"
    }

    provisioner "ansible" {
      playbook_file = "./ansible/controller-setup.yml"
  user = "rhel"
  extra_arguments = [ "-vvvv" ]
    }

}
