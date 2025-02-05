#mocked ip
variable "emptyIp" {
    default="18.212.84.35"
}

resource "null_resource" "check_public_ip" {
  provisioner "local-exec" {
    command = <<EOT
      if [ -z "${var.emptyIp}" ]; then     #
        echo "ERROR: Public IP address was not assigned." >&2
        exit 1
        else
        echo "We got the IP!"
      fi
    EOT
  }

  #depends_on = [var.emptyIp]   #changing the depand later
}
