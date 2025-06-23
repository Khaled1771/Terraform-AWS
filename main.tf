module "s3" {
  source = "./Modules/s3"
}

module "dynamodb_table" {
  source = "./Modules/dynamoDB"
}

module "vpc" {
  vpc_name   = "terraform-vpc"
  source     = "./Modules/Network"
  cidr_block = "10.0.0.0/16"
}




# provider "aws" {
#   region = "me-south-1"
# }

# resource "aws_s3_bucket" "terraform_state_lock" {
#   bucket        = "terraform-state-lock01"
#   force_destroy = true
# }

# resource "aws_s3_bucket_versioning" "versioning" {
#   bucket = aws_s3_bucket.terraform_state_lock.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = "terraform-state-lock01"
#     key = "terraform.tfstate"
#     region = "me-south-1"
#     dynamodb_table = "terraform-locking"
#   }
# }

# resource "aws_dynamodb_table" "terraform-lock-table" {
#   name         = "terraform-locking"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# resource "aws_instance" "Eco-PowerHub" {
#   ami = "ami-0e1c38f6ff084aa9d"
#   instance_type = "t3.micro"
#   tags = {
#     name = "Eco-PowerHub"
#     Description = "Testing environment for graduation project"
#   }
#   user_data = <<-EOF
#     #!/bin/bash
#     sudo apt update
#     sudo apt install nginx -y    
#     systemctl enable nginx
#     systemctl start nginx
#   EOF

#   key_name = aws_key_pair.Eco-PowerHub.id
#   vpc_security_group_ids = [ aws_security_group.ssh-access.id ] 
# }

# resource "aws_key_pair" "Eco-PowerHub" {
#   public_key = file("/mnt/MyData/Courses/AWS/keys/EcoPower.pub")
# }

# resource "aws_security_group" "ssh-access" {
#   name = "ssh-access"
#   description = "Allow SysAdmin to access the EC2 instance through SSH Port 22"
#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# output "public_ip" {
#   value = aws_instance.Eco-PowerHub.public_ip
# }

# # # -------------------   IAM Service   -------------------
# # resource "aws_iam_user" "Khaled" {
# #   name = "Khaled-Terraform"
# #   tags = {
# #     Description = "This user is created by Terraform"
# #   }
# # }

# # resource "aws_iam_policy" "adminUser" {
# #   name   = "AdminUserPolicy"
# #   policy = <<EOF
# #   {
# #     "Version": "2012-10-17",
# #     "Statement": [
# #       {
# #         "Effect": "Allow",
# #         "Action": "*",
# #         "Resource": "*"
# #       }
# #     ] 
# #   }
# #   EOF

# #   # policy = file("./admin-user.json")
# # }

# # resource "aws_iam_user_policy_attachment" "admin-user-khaled" {
# #   user       = aws_iam_user.Khaled.name
# #   policy_arn = aws_iam_policy.adminUser.arn
# # }

# # # -------------------   S3 Bucket   -------------------

# # resource "aws_s3_bucket" "Graduation-Project" {
# #   bucket = "Eco-PowerHub-2025"
# #   tags = {
# #     Description = "Storage for our graduation project"
# #   }
# # }

# # resource "aws_s3_bucket_object" "EcoPiplines" {
# #   content = "./Khaled.txt"
# #   key = "Khaled.txt"
# #   bucket = aws_s3_bucket.Graduation-Project.id
# # }


# # # resource "local_file" "khaled" {
# # #   # filename        = "Khaled.txt"
# # #   # content         = "My favourite pet is ${random_pet.assaf.id}"
# # #   # filename = var.filename[count.index]
# # #   filename = each.value
# # #   content = var.content
# # #   file_permission = "0700"

# # #   for_each = toset(var.filename)
# # #   # count = length(var.filename)
# # #   lifecycle {
# # #     create_before_destroy = true
# # #     #prevent_destroy = true      # Prevent deletion
# # #   }
# # # }

# # # resource "random_pet" "assaf" {
# # #   prefix = "Mr"
# # #   separator = "."
# # #   length = 1
# # # }

# # # # output "filename" {
# # # #   value = local_file.khaled.filename[count.index]
# # # #   sensitive = false
# # # #   description = "print the file name"
# # # # }
# # # # output "content" {
# # # #   value       = local_file.khaled.content[count.index]
# # # #   sensitive   = false
# # # #   description = "print the content of the file"
# # # # }