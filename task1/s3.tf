resource "aws_s3_bucket" "demo_bucket" {
  bucket_prefix = "first-tf-bucket"
}

resource "aws_s3_object" "demo_object" {
  bucket = aws_s3_bucket.demo_bucket.id
  key = "test_file.txt"
  source = "${path.module}/test_file.txt"
}