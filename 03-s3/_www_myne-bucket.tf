resource "aws_s3_bucket" "www_myne"{
  bucket = "www.${local.zones[terraform.workspace]}"
  acl    = "public-read"

  policy = <<EOF
{
  "Id": "bucket_policy_site",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_site_main",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${"www.${local.zones[terraform.workspace]}"}/*",
      "Principal": "*"
    }
  ]
}
EOF

  website {
    redirect_all_requests_to = "https://${local.zones[terraform.workspace]}"
  }

  tags = {
    Environment = "${var.environment}"
    Name        = "Vue s3"
  }
}

