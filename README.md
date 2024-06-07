# Terraform-champs
Solve the terraform tasks in the Terraform champs workshop

Url :https://github.com/Mohamed-Eleraki/Terraform-Champs


## Day 1: Create Networking Resources with Terraform

### Task

Use Infrastructure as Code (IaC) with Terraform to build the following resources **besides requirement specifications**:

1. **Create VPC**
2. **Create Public Subnet**
3. **Create Internet Gateway attached to the subnet**
4. **Create Route Table to route all traffic to the Internet Gateway**

### Requirement Specifications

- Resources must be created in the `us-east-1` region, otherwise, the deployment will fail.
- Resources must have the following tags, otherwise, the deployment will fail:
  - **Key**: "Environment" **Value**: "terraformChamps"
  - **Key**: "Owner" **Value**: "<type_your_name_here>"
- Prefer to use variables for configuration.

### Code Sample

https://github.com/Lamaalmassry/Terraform-champs/blob/8f4ddcfa645658b1d932ed7f03c452b09cc4b236/Day1/main.tf

## Day 2: Manage S3 Bucket with Terraform

### Task

Use Infrastructure as Code (IaC) with Terraform to build the following resources **besides requirement specifications**:

1. **Use S3 to store Terraform state file using `erakiterrafromstatefiles` bucket**
2. **Create S3 Bucket**
3. **Enable S3 Bucket Versioning**
4. **Disable ACL and ensure object ownership is "BucketOwnerEnforced"**
5. **Create a directory under the S3 Bucket called "logs"**
6. **Provide Bucket policy permission for your IAM user to upload objects only under "logs"**
7. **Force destroy Bucket even if the bucket is not empty**

### Requirement Specifications

- Resources must be created in the `us-east-1` region, otherwise, the deployment will fail.
- Resources must have the following tags, otherwise, the deployment will fail:
  - **Key**: "Environment" **Value**: "terraformChamps"
  - **Key**: "Owner" **Value**: "<type_your_name_here>"
- Prefer to use variables for configuration.

### Code Sample

https://github.com/Lamaalmassry/Terraform-champs/blob/8f4ddcfa645658b1d932ed7f03c452b09cc4b236/Day2/main.tf

## Day 3: Configure S3 Lifecycle Rules with Terraform

### Task

Use Infrastructure as Code (IaC) with Terraform to build the following resources **besides requirement specifications**:

1. **Use S3 to store Terraform state file using `erakiterrafromstatefiles` bucket (consider using a unique name for the state file key)**
2. **Create an S3 Bucket**
3. **Create Directories (e.g., /log, /outgoing, /incoming)**
4. **Configure S3 Lifecycle rules:**
   - Transition all files under `/log` to Standard-IA after 30 days.
   - Transition all files under `/log` to Glacier after 90 days.
   - Transition all files under `/log` to Deep Archive after 180 days.
   - Remove all files under `/log` after 365 days.
   - Transition all files under `/outgoing` with tag "notDeepArchive" to Standard-IA after 30 days.
   - Transition all files under `/outgoing` to Glacier with tag "notDeepArchive" after 90 days.
   - Transition all files under `/incoming` with size between 1MB and 1GB to Standard-IA after 30 days.
   - Transition all files under `/incoming` with size between 1MB and 1GB to Glacier after 90 days.

### Requirement Specifications

- Resources must be created in the `us-east-1` region, otherwise, the deployment will fail.
- Resources must have the following tags, otherwise, the deployment will fail:
  - **Key**: "Environment" **Value**: "terraformChamps"
  - **Key**: "Owner" **Value**: "<type_your_name_here>"
- Prefer to use variables for configuration.

### Code Sample

https://github.com/Lamaalmassry/Terraform-champs/blob/main/Day3/main.tf

## Day 4: Create IAM Users with Terraform

### Task

Use Infrastructure as Code (IaC) with Terraform to build the following resources **besides requirement specifications**:

1. **Use S3 to store Terraform state file using `erakiterrafromstatefiles` bucket (consider using a unique name for the state file key)**
2. **Create IAM user named Ahmed with EC2 Administrator Policy (AWS Managed policy)**
3. **Create IAM user named Mahmoud with S3 put and get objects restricted to specific source IP**
4. **Create IAM user named Mostafa with IAM Role to access get objects from S3**

### Requirement Specifications

- Resources must be created in the `us-east-1` region, otherwise, the deployment will fail.
- Resources must have the following tags, otherwise, the deployment will fail:
  - **Key**: "Environment" **Value**: "terraformChamps"
  - **Key**: "Owner" **Value**: "<type_your_name_here>"
- Prefer to use variables for configuration.

### Code Sample

https://github.com/Lamaalmassry/Terraform-champs/blob/main/Day4/main.tf

## Week Two Workshop: S3 Configuration from AWS Console using Terraform

### Task

At the end of the week, submit the following workshop. Use Infrastructure as Code (IaC) with Terraform to build the following resources **besides requirement specifications**:

1. **Use S3 to store Terraform state file using `erakiterrafromstatefiles` bucket (consider using a unique name for the state file key)**
2. **Create a general-purpose Bucket**
3. **Configure object ownership as "Bucket owner enforced"**
4. **Block all public access**
5. **Enable bucket versioning**
6. **Specify tags that include the Requirement Specifications below**
7. **Configure objects encryption as "SSE-S3"**
8. **Enable Bucket key**
9. **Disable object lock**
10. **Configure lifecycle expiration of objects at 7 days**

### Requirement Specifications

- Resources must be created in the `us-east-1` region, otherwise, the deployment will fail.
- Resources must have the following tags, otherwise, the deployment will fail:
  - **Key**: "Environment" **Value**: "terraformChamps"
  - **Key**: "Owner" **Value**: "<type_your_name_here>"
- Prefer to use variables for configuration.

### Code Sample

https://github.com/Lamaalmassry/Terraform-champs/tree/8f4ddcfa645658b1d932ed7f03c452b09cc4b236/Week%20Two%20Workshop
