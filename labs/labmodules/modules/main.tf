module "ec2" {
  source       = "../modules/ec2"
  ami          = "ami-0c02fb55956c7d316"
  machinetype  = "t2.micro"
  machinename  = "moran-vm"
}

output "printmachinename" {
  value = module.ec2.printmachinename
}

output "printmachinetype" {
  value = module.ec2.printmachinetype
}

output "printami" {
  value = module.ec2.printami
}

output "vm_public_ip" {
  value = module.ec2.vm_public_ip
}
