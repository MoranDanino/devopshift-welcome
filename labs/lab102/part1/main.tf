#moc apply
variable "emptyIp" {
    default=" "
}

#aws_instance.vm.public_ip

resource "null_resource" "check_public_ip" {
  provisioner "local-exec" {
    command = <<EOT
      if [ -z "${var.emptyIp}" ]; then     #
        echo "ERROR: Public IP address was not assigned." >&2
        exit 1
      fi
    EOT
  }

  depends_on = [var.emptyIp]   #changing the depand later
}