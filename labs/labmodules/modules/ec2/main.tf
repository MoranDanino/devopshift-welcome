provider "aws" {
 region = var.region
}

variable "region" {
 default = "us-east-1"
}

variable "machinetype" {}

variable "ami" {}

variable "machinename" {}

# Mocked IP var
variable "emptyip" {
   default = ""
}

# variable "ingress_ports" {
#   description = "List of allowed ingress ports"
#   type        = list(number)
#   default     = [22]  # Default is only SSH, can be overridden
# }


resource "aws_security_group" "sg" {
    #  dynamic "ingress" {
    #     for_each = var.ingress_ports
    #     content {
    #       from_port   = ingress.value
    #       to_port     = ingress.value
    #       protocol    = "tcp"
    #       cidr_blocks = ["0.0.0.0/0"]
    #     }
    #   }
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_instance" "vm" {
  ami           = var.ami
 instance_type = var.machinetype


 vpc_security_group_ids = [aws_security_group.sg.id]


 tags = {
   Name = var.machinename
 }
}

output "vm_public_ip" {
 value       = aws_instance.vm.public_ip
 description = "Public IP address of the VM"
 depends_on = [ null_resource.check_public_ip ]
}

resource "null_resource" "check_public_ip" {
 provisioner "local-exec" {
   command = <<EOT
     if [ -z "${aws_instance.vm.public_ip}" ]; then
       echo "ERROR: Public IP address was not assigned." >&2
       exit 1
       else
       echo "We got the IP! ${aws_instance.vm.public_ip}"
     fi
   EOT
 }

 depends_on = [aws_instance.vm]
}

output "printmachinename" {
    value = var.ami
}

output "printmachinetype" {
    value = var.machinetype
}

output "printami" {
    value = var.ami
}

output "security_group_id" {
  value       = aws_security_group.sg.id
  description = "The ID of the created security group"
}









