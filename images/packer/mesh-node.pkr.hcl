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
    default = null
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

locals { 
    extra_args = var.ansible_vars_file != null ? ["-e", "@images/ansible/extra-vars.yml", "-e", var.ansible_vars_file,
                                                "-e", "track_slug=${var.track_slug}"] : ["-e", "@images/ansible/extra-vars.yml",
                                                "-e", "track_slug=${var.track_slug}"]
    slug_image_name = var.image_name != null ? var.image_name : "${var.track_slug}-node"
}

source "googlecompute" "mesh-node" {
    project_id          = var.project_id
    source_image_family = "rhel-9"
    ssh_username        = "rhel"
    wait_to_add_ssh_keys = "60s"
    zone                = var.zone
    machine_type        = "e2-standard-2"
    image_name          = local.slug_image_name
}

build {
    sources = ["sources.googlecompute.mesh-node"]
    provisioner "ansible" {
      command = "ansible-playbook"
      playbook_file = "${path.root}/../ansible/${var.track_slug}_node-setup.yml"
      user = "rhel"
      extra_arguments = local.extra_args
      use_proxy = false
    }
}
