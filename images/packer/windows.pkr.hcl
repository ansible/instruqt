variable "project_id" {
    type    = string
    default = "red-hat-mbu"
}

source "googlecompute" "windows" {
    project_id          = var.project_id
    source_image_family = "windows-2016"
    zone                = "us-east1-d"
    machine_type        = "n1-standard-2"
    image_name          = "windows"
    disk_size		= 50
    communicator	= "winrm"
    winrm_username	= "windows"
    winrm_insecure	= true
    winrm_use_ssl	= true
    metadata = {
   	 windows-startup-script-cmd = "winrm quickconfig -quiet & net user /add windows & net localgroup administrators windows /add & winrm set winrm/config/service/auth @{Basic=\"true\"}"
    }
}


build {
    sources = ["sources.googlecompute.windows"]
    
    provisioner "shell-local" {
      inline = ["pip install pywinrm requests requests-credssp", "ansible-galaxy collection install community.windows chocolatey.chocolatey"]
    } 

    provisioner "ansible" {
      playbook_file = "${path.root}/../ansible/windows-setup.yml"
      user = "windows"
      use_proxy = false
      keep_inventory_file = true
      extra_arguments = [
	"-e ansible_winrm_server_cert_validation=ignore",
      ]
    }
    provisioner "powershell" {
      inline = ["C:\\Windows\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /quiet /quit", "while($true) { $imageState = Get-ItemProperty HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\State | Select ImageState; if($imageState.ImageState -ne 'IMAGE_STATE_GENERALIZE_RESEAL_TO_OOBE') { Write-Output $imageState.ImageState; Start-Sleep -s 10  } else { break } }"]
    }


}
