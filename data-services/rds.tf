# First application database
resource "aws_db_instance" "first" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = var.db_instance_type
  name                        = "first_application_database"
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  backup_window               = "22:00-23:00"
  maintenance_window          = "Sat:00:00-Sat:03:00"
  skip_final_snapshot         = true

  multi_az                    = false
  availability_zone           = var.availability_zone[0]
  db_subnet_group_name        = var.db_subnet_group_name
  vpc_security_group_ids      = [var.vpc_security_group_ids[0]]
  username                    = var.db_username
  password                    = var.db_password
  tags = {
    name = "First application database"
  }

  storage_encrypted = true

  enabled_cloudwatch_logs_exports = [ 
    "audit",
    "error",
    "general",
    "slowquery"
  ]
}

# Second application database
resource "aws_db_instance" "second" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "sqlserver-web"
  engine_version              = "13.00.5850.14.v1"
  instance_class              = var.db_instance_type
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 35
  backup_window               = "22:00-23:00"
  maintenance_window          = "Sat:00:00-Sat:03:00"
  skip_final_snapshot         = true

  multi_az                    = false
  availability_zone           = var.availability_zone[1]
  db_subnet_group_name        = var.db_subnet_group_name
  vpc_security_group_ids      = [var.vpc_security_group_ids[1]]
  username                    = var.db_username
  password                    = var.db_password
  tags = {
    name = "Second application database"
  }

  storage_encrypted = true

  enabled_cloudwatch_logs_exports = [
    "agent",
    "error"
  ]
}