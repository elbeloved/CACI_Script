# CACI Terraform Script

Terraform module which creates multiple resources on AWS.

This script includes both Root and Child modules. The Root module is separated into different environments and is used to create resources in the Child modules. The Child modules can also be used separately to create independent resources:

- [ASG-BASE](https://github.com/elbeloved/CACI_Script/tree/main/MODULES/ASG-BASE) - creates an autoscaling group
- [IAM-BASE](https://github.com/elbeloved/CACI_Script/tree/main/MODULES/IAM-BASE) - creates an IAM instance-profile/role
- [SECURITY-BASE](https://github.com/elbeloved/CACI_Script/tree/main/MODULES/SECURITY-BASE) - creates a security-group
- [VPC-BASE](https://github.com/elbeloved/CACI_Script/tree/main/MODULES/VPC-BASE) - creates a VPC/subnets

## Required Variables

- [terraform.tfvars](https://github.com/elbeloved/CACI_Script/tree/main/Environment/DEV/us-east-1/terraform.tfvars) in root module is missing below credentials:

```hcl
AWS_ACCESS_KEY
AWS_SECRET_KEY
AWS_REGION
```

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Conditional creation

The following values are provided to alter creation of the associated resources as desired:

```hcl
module "ASG-BASE" {
  source = "MODULES/ASG-BASE/main.tf"

  # Disable creation of load balance internally
  internal = false

  # To use 100% spot instances for infrastructure creation 
  mixed_instances_policy {
    instances_distribution {
      spot_allocation_strategy = var.ASG_Components["spot_allocation_strategy"]
    }
  }
}
```
