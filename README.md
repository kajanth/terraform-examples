# terraform

AWS Tfvars example file.
```
aws_access_key = "xxxxxxxxxxxxxxxxx"
aws_secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#i.e. eu-west-1 (EU (Ireland), ap-northeast-1 Asia Pacific (Tokyo), us-east-1 US East (N. Virginia)
aws_region = "eu-west-1"

```

terraform plan   -var-file="aws.tfvars"
