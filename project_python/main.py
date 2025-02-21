# import boto3
# import subprocess
# import json
from botocore.exceptions import ClientError
from models import Aws_Validation, exec_file_as_json, list_instances, list_alb, get_terraform_output
import subprocess
import json

###aws configure for connecting aws account

#AWS region
region = "us-east-1"

# def run_terraform():
#     #run terraform file
#     try:
#         subprocess.run(["terraform", "init"], check=True)
#         subprocess.run(["terraform", "apply", "-auto-approve"], check=True)
#     except subprocess.CalledProcessError as e:
#         print(f"error in terraform")
#         exit()

#run terraform file:
# run_terraform()

# Fetch Outputs from Terraform
instance_id = get_terraform_output("instance_id")
load_balancer_dns_name = get_terraform_output("ld_dns_name")

instance_details = list_instances(instance_id)
alb_details = list_alb(load_balancer_dns_name)
final_defails = {**instance_details, **alb_details} #merge the two dictionaries
exec_file_as_json(Aws_Validation(**final_defails), "aws_validation.json")
