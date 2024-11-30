moved {
  from = aws_s3_bucket.uniqe_bucket
  to   = aws_s3_bucket.unique_bucket
}

moved {
  from = aws_route53_record.primary
  to   = aws_route53_record.old_primary[0]
}