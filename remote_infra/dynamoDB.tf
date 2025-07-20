resource "aws_dynamodb_table" "my-dynamodb-table" {
  name           = "remote-dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
 

  attribute {
    name = "LockID"
    type = "S"
  }


  tags = {
    Name        = "remote-dynamodb-table"
    Environment = "production"
  }
}