variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

source "googlecompute" "ansible-community" {
    project_id          = var.project_id
    source_image        = "centos-stream-8-v20220128"
    ssh_username        = "packer"
    zone                = "us-east1-d"
    machine_type        = "n1-standard-1"
    image_name          = "ansible-community"
}


build {
    sources = ["sources.googlecompute.ansible-community"]

    provisioner "file" {
        source = "${path.root}/ansible/setup-scripts/community/setup.sh"
        destination = "/tmp/setup.sh"
    }

    provisioner "shell" {
        inline = ["sudo bash /tmp/setup.sh"]
    }
}
