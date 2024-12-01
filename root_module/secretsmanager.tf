resource "aws_secretsmanager_secret" "db_credentials" {
  name = "database_credentials"

  tags = {
    Environment = "Development"
  }
}

resource "random_password" "db_password" {
  length  = 20
  special = false
  min_lower = 1
  min_upper = 1
  min_numeric = 1
}

resource "aws_secretsmanager_secret_version" "db_credentials_version" {
  secret_id = aws_secretsmanager_secret.db_credentials.id

  secret_string = jsonencode({
    username = "user"
    database = "placeholder_db"
    password = random_password.db_password.result
  })

  # ignore changes to secret_string
  # since can be updated by lambda (hypothetically)
  lifecycle {
    ignore_changes = [ secret_string ]
  }
}
