variable "directory_path" {
  description = "Path of the directory to manage"
  type        = string
}

resource "null_resource" "create_ken_dir" {
  provisioner "local-exec" {
    command = "mkdir -p ${self.triggers.directory_path}"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf ${self.triggers.directory_path}"
  }

  triggers = {
    directory_path = var.directory_path
    always_run     = timestamp()
  }
}

resource "local_file" "ken_dir_marker" {
  content  = "This directory is managed by Terraform."
  filename = "${var.directory_path}/.terraform_marker.txt"
}

