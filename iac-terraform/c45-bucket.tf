#creo S3 publicos para publicar el frontend

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment_prefix}${var.s3_bucket_postfix}"
}

resource "aws_s3_bucket_website_configuration" "my-static-website" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public" {
  depends_on = [aws_s3_bucket.bucket,
                aws_s3_bucket_acl.my-static-website]
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

# S3 bucket ACL access

resource "aws_s3_bucket_ownership_controls" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my-static-website" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket,
    aws_s3_bucket_public_access_block.bucket,
  ]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

#imprimo la URL de la pagina estatica
# s3 static website url

output "website_url" {
  value = "http://${aws_s3_bucket.bucket.bucket}.s3-website.${var.region}.amazonaws.com"
}
