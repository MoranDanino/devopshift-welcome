provider "aws" {
 region = var.region
}

variable "region" {
 default = "us-east-1"
}

# variable "ami" {
#  default = data.aws_ami.myami.id #"ami-04b4f1a9cf54c11d0"
#  }
 
variable "vm_name" {
 default = "vm-Moran"
}

variable "admin_username" {
 default = "admin-user"
}

variable "admin_password" {
 default = "Password123!"
}

variable "vm_size" {
 default = "t2.micro"
}

data "aws_ami" "myami"{
    owners = ["self"]
    filter {
        name   = "name"
        values = ["terraform-workshop-image-do-not-delete"]
    }   
}

output "ami_id" {
  value      = data.aws_ami.myami.id
  description = "image id"
}
