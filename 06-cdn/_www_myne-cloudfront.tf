resource "aws_cloudfront_distribution" "www_myne_front" {
  origin {
    domain_name = replace("www.${local.zones[terraform.workspace]}", "/^https?://([^/]*).*/", "$1")
    origin_id   = "s3"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }
  enabled         = true
  is_ipv6_enabled = true
  comment         = "Front Cloudfront"

  aliases = ["*.${local.zones[terraform.workspace]}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3"
    forwarded_values {
      headers      = ["*"]
      query_string = false
      cookies {
        forward = "none"
      }
    }
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
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
