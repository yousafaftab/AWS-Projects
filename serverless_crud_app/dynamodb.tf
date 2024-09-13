resource "aws_dynamodb_table" "this" {
  name           = "${var.username}-table"
  hash_key       = "UserId"
  range_key      = "GameTitle"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
    read_capacity      = 5
    write_capacity     = 5
  }

  tags = {
    Name        = "${var.username}-table"
    Environment = "dev"
  }
}
