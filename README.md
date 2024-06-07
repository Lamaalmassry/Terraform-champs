# Terraform-champs
Solve the terraform tasks in the Terraform champs workshop

Url :https://github.com/Mohamed-Eleraki/Terraform-Champs

# Day 1: Create Networking Resources with Terraform

**Task**
Use Infrastructure as Code (IaC) with Terraform to build the following resources:

Create VPC
Create Public Subnet
Create Internet Gateway attached to the subnet
Create Route Table to route all traffic to the Internet Gateway
Requirement Specifications
Resources must be created in the us-east-1 region, otherwise, the deployment will fail.
Resources must have the following tags, otherwise, the deployment will fail:
Key: "Environment" Value: "terraformChamps"
Key: "Owner" Value: "<type_your_name_here>"
Prefer to use variables for configuration.
Day 2: Manage S3 Bucket with Terraform
Task
Use Infrastructure as Code (IaC) with Terraform to build the following resources:

Use S3 to store Terraform state file using erakiterrafromstatefiles bucket
Create S3 Bucket
Enable S3 Bucket Versioning
Disable ACL and ensure object ownership is "BucketOwnerEnforced"
Create a directory under the S3 Bucket called "logs"
Provide Bucket policy permission for your IAM user to upload objects only under "logs"
Force destroy Bucket even if the bucket is not empty
Requirement Specifications
Resources must be created in the us-east-1 region, otherwise, the deployment will fail.
Resources must have the following tags, otherwise, the deployment will fail:
Key: "Environment" Value: "terraformChamps"
Key: "Owner" Value: "<type_your_name_here>"
Prefer to use variables for configuration.
Day 4: Configure S3 Lifecycle Rules with Terraform
Task
Use Infrastructure as Code (IaC) with Terraform to build the following resources:

Use S3 to store Terraform state file using erakiterrafromstatefiles bucket (consider using a unique name for the state file key)
Create an S3 Bucket
Create Directories (e.g., /log, /outgoing, /incoming)
Configure S3 Lifecycle rules:
Transition all files under /log to Standard-IA after 30 days.
Transition all files under /log to Glacier after 90 days.
Transition all files under /log to Deep Archive after 180 days.
Remove all files under /log after 365 days.
Transition all files under /outgoing with tag "notDeepArchive" to Standard-IA after 30 days.
Transition all files under /outgoing to Glacier with tag "notDeepArchive" after 90 days.
Transition all files under /incoming with size between 1MB and 1GB to Standard-IA after 30 days.
Transition all files under /incoming with size between 1MB and 1GB to Glacier after 90 days.
Requirement Specifications
Resources must be created in the us-east-1 region, otherwise, the deployment will fail.
Resources must have the following tags, otherwise, the deployment will fail:
Key: "Environment" Value: "terraformChamps"
Key: "Owner" Value: "<type_your_name_here>"
Prefer to use variables for configuration.
Day 4: Create IAM Users with Terraform
Task
Use Infrastructure as Code (IaC) with Terraform to build the following resources:

Use S3 to store Terraform state file using erakiterrafromstatefiles bucket (consider using a unique name for the state file key)
Create IAM user named Ahmed with EC2 Administrator Policy (AWS Managed policy)
Create IAM user named Mahmoud with S3 put and get objects restricted to specific source IP
Create IAM user named Mostafa with IAM Role to access get objects from S3
Requirement Specifications
Resources must be created in the us-east-1 region, otherwise, the deployment will fail.
Resources must have the following tags, otherwise, the deployment will fail:
Key: "Environment" Value: "terraformChamps"
Key: "Owner" Value: "<type_your_name_here>"
Prefer to use variables for configuration.
Week Two Workshop: S3 Configuration from AWS Console using Terraform
Task
At the end of the week, submit the following workshop. Use Infrastructure as Code (IaC) with Terraform to build the following resources:

Use S3 to store Terraform state file using erakiterrafromstatefiles bucket (consider using a unique name for the state file key)
Create a general-purpose Bucket
Configure object ownership as "Bucket owner enforced"
Block all public access
Enable bucket versioning
Specify tags that include the Requirement Specifications below
Configure objects encryption as "SSE-S3"
Enable Bucket key
Disable object lock
Configure lifecycle expiration of objects at 7 days
Requirement Specifications
Resources must be created in the us-east-1 region, otherwise, the deployment will fail.
Resources must have the following tags, otherwise, the deployment will fail:
Key: "Environment" Value: "terraformChamps"
Key: "Owner" Value: "<type_your_name_here>"
Prefer to use variables for configuration.
