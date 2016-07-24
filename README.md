# terraform

## These terraform examples are not operation grade!

Create credentials.tfvars file in the root of this repo and add AWS access keys.

AWS Tfvars example file.
```
aws_access_key = "xxxxxxxxxxxxxxxxx"
aws_secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#i.e. eu-west-1 (EU (Ireland), ap-northeast-1 Asia Pacific (Tokyo), us-east-1 US East (N. Virginia)
aws_region = "eu-west-1"

```

To use the VPC example.

```
cd vpc
make plan
make apply
```
