# 🚀 Deploying AWS EC2 with Terraform

This project provisions an **Amazon Linux 2 EC2 instance** on AWS using Terraform, including SSH access, IAM setup, and security configuration.

---

## ✅ Learning Objectives

- Learn how to use Terraform with AWS
- Deploy basic cloud infrastructure: EC2, Security Group, Key Pair
- Follow AWS best practices: IAM user, CLI config, destroy cleanup
- Manage code with Git and GitHub

---

## 🧱 Architecture Overview

- ✅ 1 IAM user with programmatic access (Access Key / Secret Key)
- ✅ 1 local SSH key pair (`my-key` / `my-key.pub`)
- ✅ 1 Security Group allowing SSH (port 22)
- ✅ 1 EC2 instance (Amazon Linux 2, `t2.micro`, Free Tier eligible)
- ❌ No custom VPC or Elastic IP in this version
