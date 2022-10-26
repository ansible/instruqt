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
    default = "mesh-node"
}

variable "ansible_vars_file" {
    type    = string
    default = null
}

variable "track_slug" {
    type    = string
    default = "${env("TRACK_SLUG")}"
    validation {
        condition     = length(var.track_slug) > 0
        error_message = "Set the TRACK_SLUG environment variable or track_slug Packer variable."
    }
}

local "extra_args" {
    expression = var.ansible_vars_file != null ? ["-e", "@images/ansible/extra-vars.yml", "-e", var.ansible_vars_file, "-e", "track_slug=${var.track_slug}"] : ["-e", "@images/ansible/extra-vars.yml",  "-e", "track_slug=${var.track_slug}"]
}

source "googlecompute" "mesh-node" {
    project_id          = var.project_id
    source_image_family = "rhel-8"
    ssh_username        = "rhel"
    wait_to_add_ssh_keys = "60s"
    zone                = var.zone
    machine_type        = "n2-standard-2"
    image_name          = var.image_name
}

build {
    sources = ["sources.googlecompute.mesh-node"]
    provisioner "ansible" {
      command = "ansible-playbook"
      playbook_file = "${path.root}/../ansible/${var.track_slug}_node_setup.yml"
      user = "rhel"
      extra_arguments = local.extra_args
    }
}
