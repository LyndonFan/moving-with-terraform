resource "aws_acm_certificate" "example_cert" {
  domain_name       = "example.co.uk"

  lifecycle {
    create_before_destroy = true
  }
}

import {
    # todo: update me in live demo with correct arn
    id = "arn:aws:acm:eu-west-2:000000000000:certificate/6e43b776-ec3a-46b2-aa80-65467a8ed827"
    to = aws_acm_certificate.example_cert
}