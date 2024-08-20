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
 

# Week Three Workshop

## Overview
This week's workshop focuses on using Infrastructure as Code (IaC) with Terraform to manage AWS resources, specifically S3, IAM users, and roles. You'll configure S3 policies and test accessibility using AWS CLI commands.

## Task Outline

1. **Create S3 Bucket for Terraform State File:**
   - Use the bucket name `erakiterrafromstatefiles`.
   - Specify a unique name for the state file key to avoid conflicts.
   - Create a directory under the S3 bucket called `logs`.

2. **Create IAM Users:**
   - User 1: `Mostafa`
   - User 2: `Taha`

3. **Create IAM Role for Taha:**
   - Assign the role with the `s3:GetObject` policy, restricted to the `logs` directory.

4. **Configure S3 Policy:**
   - Allow `Mostafa` to `s3:PutObject` in the entire S3 bucket.

5. **Test Accessibility Using AWS CLI:**
   - Verify access using AWS CLI `s3` commands.
   - Verify access using AWS CLI `s3api` commands.

6. **Fork a GitHub Repository:**
   - Fork the provided repository.
   - Append your Terraform code samples to the code samples section.
   - Submit a pull request for review.

## Requirement Specifications

- Resources must be created in the **us-east-1** region.
- Resources must have the following tags:
  - **Key**: `Environment` | **Value**: `terraformChamps`
  - **Key**: `Owner` | **Value**: `<type_your_name_here>`
- Prefer to use variables for configuration.

## Diagram

Create a diagram of this deployment using draw.io or any diagramming tool of your choice.


# Week Four Task

## Overview
This week's task focuses on learning about EC2 instance types and VPC endpoints. You'll also append new knowledge to your documentation and fork a GitHub repository to submit your code samples.

## Task Outline

1. **Learn about EC2 Instance Types and VPC Endpoints:**
   - Study the different EC2 instance types.
   - Understand the purpose and functionality of VPC endpoints.

2. **Append New Knowledge to Your Documentation:**
   - Document what you've learned about EC2 instance types and VPC endpoints.

3. **Fork a GitHub Repo and Append Your Code Samples:**
   - Fork the provided repository.
   - Append your Terraform code samples to the code samples section.
   - Submit a pull request for review.

4. **Design a Deployment Diagram:**
   - Use draw.io or any diagramming tool to create a diagram of the deployment.

## Week Four Workshop

### Task Outline

1. **Create an S3 Bucket for Terraform State File:**
   - Use the bucket name `erakiterrafromstatefiles`.
   - Specify a unique name for the state file key to avoid conflicts.
   - Create a general-purpose S3 bucket.
   - Create a directory under the S3 bucket called `logs`.

2. **Create IAM Role for EC2 Instance:**
   - Assign the AWS managed policy for `s3:FullAccess` to the role.

3. **Create an EC2 Instance:**
   - Attach the IAM role to the EC2 instance.
   - Verify accessibility by sending a file to the S3 bucket from the EC2 instance using AWS CLI `s3` and `s3api` commands.

4. **Submit Your Code:**
   - Fork the provided repository.
   - Append your Terraform code samples.
   - Submit a pull request for review.

## Requirement Specifications

- Resources must be created in the **us-east-1** region.
- Resources must have the following tags:
  - **Key**: `Environment` | **Value**: `terraformChamps`
  - **Key**: `Owner` | **Value**: `<type_your_name_here>`
- Prefer to use variables for configuration.

---

# Week Five Task

## Overview
This week's focus is on learning about Amazon RDS and deploying an RDS instance using Terraform. You'll append new knowledge to your documentation, fork a GitHub repository, and submit your code samples.

## Task Outline

1. **Dig Deep into RDS:**
   - Study Amazon RDS using AWS documentation.
   - Document your findings in your documentation.

2. **Fork a GitHub Repo and Append Your Code Samples:**
   - Fork the provided repository.
   - Append your Terraform code samples to the code samples section.
   - Submit a pull request for review.

3. **Design a Deployment Diagram:**
   - Use draw.io or any diagramming tool to create a diagram of the deployment.

## Week Five Workshop

### Task Outline

1. **Create an S3 Bucket for Terraform State File:**
   - Use the bucket name `erakiterrafromstatefiles`.
   - Specify a unique name for the state file key.

2. **Create a VPC, Subnets, and Security Group:**
   - VPC: `vpc-01`
   - Subnets: `subnet-01`, `subnet-02`
   - Security Group: `sg-01`
     - Allows inbound traffic on port 5432 from all sources.
     - Allows outbound traffic for all.

3. **Create a Subnet Group for RDS:**
   - Include the created subnets in the subnet group.

4. **Create an RDS Instance:**
   - Database: PostgreSQL (latest version)
   - Storage: 20 GB
   - Instance Class: `db.t3.micro`
   - Database Name: `postgresqldatabase`
   - Username: `postgres`
   - Password: `CHOOSE ONE`
   - Security Group: `sg-01`
   - Skip final snapshot: `true`

5. **Test Connection Using pgAdmin:**
   - Ensure the RDS instance is publicly accessible.
   - Connect to the RDS instance from your local device using pgAdmin.

## Requirement Specifications

- Resources must be created in the **us-east-1** region.
- Resources must have the following tags:
  - **Key**: `Environment` | **Value**: `terraformChamps`
  - **Key**: `Owner` | **Value**: `<type_your_name_here>`
- Prefer to use variables for configuration.

# Week Eight - Lambda: Manage File Transfer Between S3 Buckets

## Overview
FrogTech faces the challenge of automating the manual process of transferring files between two S3 buckets: `frogtech-us-external` and `frogtech-us-internal`. Currently, operators manually move files between these buckets, but the goal is to automate this process using an AWS Lambda function. You are tasked with designing and implementing this solution using Terraform and providing documentation to help FrogTech engineers understand the basics of Lambda.

## Task Outline

### 1. **Basics of AWS Lambda**
   - **Function Event:**
     - An event is the data or message that triggers the Lambda function. Events can come from various sources like S3, API Gateway, or CloudWatch.

   - **Function Context:**
     - The context object provides information about the invocation, function configuration, and execution environment.

   - **Function Environment Variables:**
     - These are key-value pairs that are set at the time of Lambda function creation and are accessible within your function code.

   - **Lambda Layers:**
     - Layers allow you to package libraries and other dependencies that you can use with your Lambda function.

   - **Differences Between Synchronous and Asynchronous Invocations:**
     - **Synchronous**: The caller waits for the function to process the event and return a response.
     - **Asynchronous**: The function is invoked, and the caller does not wait for a response.

### 2. **Implementation Using Terraform**

   - **Create the Lambda Function:**
     - Use the AWS Python SDK (Boto3) to manage file transfers between S3 buckets.
   
   - **Setup S3 Buckets:**
     - Ensure the buckets `frogtech-us-external` and `frogtech-us-internal` are configured correctly.
   
   - **Define the Lambda Trigger:**
     - Set up an event trigger (e.g., S3 put event) to invoke the Lambda function when a file is uploaded to `frogtech-us-external`.
   
   - **Environment Variables:**
     - Use Terraform to define and pass environment variables to the Lambda function.
   
   - **Create IAM Role:**
     - Define an IAM role for the Lambda function with appropriate permissions to access the S3 buckets.

### 3. **Design a Deployment Diagram**
   - Use a diagramming tool (e.g., draw.io) to create a diagram that illustrates the process flow and the resources created.

## Requirement Specifications

1. **Region:** 
   - All resources must be created in the `us-east-1` region.

2. **Tags:**
   - Resources must have the following tags:
     - **Key**: `Environment` | **Value**: `terraformChamps`
     - **Key**: `Owner` | **Value**: `<Your_First_Name>`

3. **Use of Variables:**
   - Preferably use variables in your Terraform code to manage configurations and resource attributes.



