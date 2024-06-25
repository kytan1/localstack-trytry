module "dynamodb"  {
  source = "terraform-aws-modules/dynamodb-table/aws"
  name   = "payment"

  hash_key         = "PaymentId"
  range_key        = "Description"
  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"

    tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }


  attributes = [
    {
      name = "PaymentId"
      type = "S"
    },
        {
      name = "Description"
      type = "S"
    }
  ]
}