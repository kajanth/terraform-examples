provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

#These variables are empty as passed from .tfvars file

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

resource "aws_cloudtrail" "trail" {
    name = "${var.trail_name}"
    s3_bucket_name = "${aws_s3_bucket.trailbucket.id}"
    include_global_service_events = true
    is_multi_region_trail = true

    tags {
    environment = "${var.environment}"
    }

}



resource "aws_s3_bucket" "trailbucket" {
    bucket = "${var.bucket_name}"
    force_destroy = true
    tags {
    environment = "${var.environment}"
    }


    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.bucket_name}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
