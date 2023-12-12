#creo S3 publicos para publicar el frontend

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment_prefix}${var.s3_bucket_postfix}"
}


resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_policy" "public" {
  depends_on = [aws_s3_bucket.bucket]
  bucket = aws_s3_bucket.bucket.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.bucket.arn}/*"
        }
    ]
}
POLICY
}