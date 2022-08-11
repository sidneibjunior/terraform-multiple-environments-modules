variable "dynamodb_terraform_table_test" {
  type = object({
    billing_mode   = string
    read_capacity  = number
    write_capacity = number
  })
}

resource "aws_dynamodb_table" "terraform_table_test" {
  name           = "terraform-table-test-${var.dynamo_table_sufix}"
  
  billing_mode   = "${var.dynamodb_terraform_table_test.billing_mode}"
  read_capacity  = var.dynamodb_terraform_table_test.read_capacity
  write_capacity = var.dynamodb_terraform_table_test.write_capacity

  hash_key       = "UserId"
  range_key      = "SecondaryKey"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "SecondaryKey"
    type = "S"
  }

  tags = {
    Environment = "${var.environment}"
  }
}
