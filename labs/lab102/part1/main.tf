# #mocked ip
# variable "emptyIp" {
#     default="18.212.84.35"
# }

# resource "null_resource" "check_public_ip" {
#   provisioner "local-exec" {
#     command = <<EOT
#       if [ -z "${var.emptyIp}" ]; then     #
#         echo "ERROR: Public IP address was not assigned." >&2
#         exit 1
#         else
#         echo "We got the IP!"
#       fi
#     EOT
#   }

#   #depends_on = [var.emptyIp]   #changing the depand later
# }


provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-east-1"
}

data "aws_instance" "example" {
  instance_id = "i-09df7e0ed385f871b" #option1
  # filter {                            
  #   name = "tag:Name"
  #   values = ["yaniv-vm"]
  # }
}

output "public_ip" {
  value      = data.aws_instance.example.public_ip
  description = "Public IP address of the VM"
}
