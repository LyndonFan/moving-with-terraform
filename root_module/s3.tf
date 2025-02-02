# Create an S3 Bucket
resource "aws_s3_bucket" "unique_bucket" {
  bucket = "my-bucket"

  tags = {
    Name        = "My Bucket"
    Environment = "Development"
  }
}