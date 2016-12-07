output "cloudtrail_id" {
    value = "${aws_cloudtrail.trail.id}"
}

output "bucket_id" {
    value = "${aws_s3_bucket.trailbucket.id}"
}

output "bucket_arn" {
    value = "${aws_s3_bucket.trailbucket.arn}"
}
