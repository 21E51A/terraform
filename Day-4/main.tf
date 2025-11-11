module "s3" {
    source = "terraform-aws-modules/s3-bucket/aws"
    bucket = "11-11-2025-s3"
    acl = "private"
    control_object_ownership = true
    object_ownership         = "ObjectWriter"

    versioning = {
    enabled = true
}
}