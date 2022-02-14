source "googlecompute" "ansible-community" {
    project_id          = "angelic-hold-338616"
    source_image        = "centos-stream-8-v20220128"
    ssh_username        = "devops"
    zone                = "us-east1-d"
    machine_type        = "n1-standard-1"
    image_name          = "ansible-community"
}


build {
    sources = ["sources.googlecompute.ansible-community"]

    provisioner "ansible" {
        playbook_file = "./ansible/ansible-setup.yml"
        user = "devops"
    }
}
