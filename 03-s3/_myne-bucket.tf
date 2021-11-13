resource "aws_s3_bucket" "_myne" {
  bucket = "${local.zones[terraform.workspace]}"
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
      "Resource": "arn:aws:s3:::${"${local.zones[terraform.workspace]}"}/*",
      "Principal": "*"
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Environment = "${var.environment}"
    Name        = "Vue s3"
  }
}

