#NO_WWWW
 output "_domain_name"{
   value = aws_cloudfront_distribution._myne_front.domain_name
 }
 output "_hosted_zone_id"{
   value = aws_cloudfront_distribution._myne_front.hosted_zone_id
 }

#WWWW
 output "www_domain_name"{
   value = aws_cloudfront_distribution._www_myne_front.domain_name
 }
 output "www_hosted_zone_id"{
   value = aws_cloudfront_distribution._www_myne_front.hosted_zone_id
 }

#API
# output "api_domain_name"{
#   value = aws_cloudfront_distribution.api_myne_front.domain_name
# }
# output "api_hosted_zone_id"{
#   value = aws_cloudfront_distribution.api_myne_front.hosted_zone_id
# }

#APP
output "app_domain_name"{
  value = aws_cloudfront_distribution.app_myne_front.domain_name
}
output "app_hosted_zone_id"{
  value = aws_cloudfront_distribution.app_myne_front.hosted_zone_id
}

#AUDIOS
#  output "audios_domain_name"{
#    value = aws_cloudfront_distribution.audios_front.domain_name
#  }
#  output "audios_hosted_zone_id"{
#    value = aws_cloudfront_distribution.audios_front.hosted_zone_id
#  }

#FILES
# output "files_domain_name"{
#   value = aws_cloudfront_distribution.files_myne_front.domain_name
# }
# output "files_hosted_zone_id"{
#   value = aws_cloudfront_distribution.files_myne_front.hosted_zone_id
# }

#IMAGES
# output "images_domain_name"{
#   value = aws_cloudfront_distribution.images_myne_front.domain_name
# }
# output "images_hosted_zone_id"{
#   value = aws_cloudfront_distribution.images_myne_front.hosted_zone_id
# }

#PDF
# output "pdf_domain_name"{
#   value = aws_cloudfront_distribution.pdf_front.domain_name
# }
# output "pdf_hosted_zone_id"{
#   value = aws_cloudfront_distribution.pdf_front.hosted_zone_id
# }

#USERPHOTOS
# output "userphotos_domain_name"{
#   value = aws_cloudfront_distribution.userphotos_front.domain_name
# }
# output "userphotos_hosted_zone_id"{
#   value = aws_cloudfront_distribution.userphotos_front.hosted_zone_id
# }

#VIDEOS
# output "videos_domain_name"{
#   value = aws_cloudfront_distribution.videos_myne_front.domain_name
# }
# output "videos_hosted_zone_id"{
#   value = aws_cloudfront_distribution.videos_myne_front.hosted_zone_id
# }