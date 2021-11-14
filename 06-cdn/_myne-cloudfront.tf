resource "aws_cloudfront_distribution" "_myne_front" {

  origin {
    domain_name = data.terraform_remote_state.s3.outputs._myne_bucket_regional_name
    origin_id   = "s3"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_root_object            = "index.html"
  enabled         = true
  is_ipv6_enabled = true
  comment         = "Front Cloudfront"

  aliases = ["${local.zones[terraform.workspace]}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl = 0
    default_ttl = 0
    max_ttl = 0
    viewer_protocol_policy = "redirect-to-https"
  }

  tags = {
    Environment = "${var.environment}"
    Name        = "Front End www.${local.zones[terraform.workspace]} Cloudfront"
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = data.terraform_remote_state.zone.outputs.public_certificate_arn
    ssl_support_method             = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
