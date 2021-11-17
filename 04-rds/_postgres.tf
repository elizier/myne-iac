resource "aws_db_parameter_group" "postgres-12" {
  name   = "${local.prefix}postgres-12"
  family = "postgres12"

  parameter {
    name  = "log_min_duration_statement"
    value = "0"
    apply_method = "immediate"
  }

  parameter {
    name  = "checkpoint_timeout"
    value = "3600"
    apply_method = "immediate"
  }

  parameter {
    name  = "effective_cache_size"
    value = "{DBInstanceClassMemory/524288}"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "log_statement"
    value = "all"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_autovacuum_min_duration"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_connections"
    value        = "1"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_disconnections"
    value        = "1"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_error_verbosity"
    value        = "default"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_lock_waits"
    value        = "1"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_min_duration_statement"
    value        = "0"
    apply_method = "immediate"
  }
  parameter {
    name         = "log_statement"
    value        = "all"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_temp_files"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    apply_method = "immediate"
    name         = "rds.force_autovacuum_logging_level"
    value        = "log"
  }
}

# resource "aws_db_option_group" "myne" {
#   name   = "${local.prefix}postgres-12"
#   option_group_description = "Myne Terraform Option Group"
#   engine_name              = "postgres"
#   major_engine_version     = "12"

#   option {
#     option_name = "rds.ext"

#     option_settings {
#       name  = "rds.ext"
#       value = ""
#     }
#   }
# }

module "postgres" {
  source                              = "terraform-aws-modules/rds/aws"
  version                             = "2.13.0"
  identifier                          = local.postgres_dbname
  ca_cert_identifier                  = "rds-ca-2019"
  engine                              = "postgres"
  engine_version                      = "12.5"
  instance_class                      = var.postgres_instance_class
  allocated_storage                   = var.postgres_allocated_storage
  max_allocated_storage               = var.postgres_max_allocated_storage
  username                            = "postgres"
  password                            = "s3nh41nic1al"
  port                                = "5432"
  vpc_security_group_ids              = [data.terraform_remote_state.sgr.outputs.postgres_sec_group_id]
  maintenance_window                  = "Mon:00:00-Mon:03:00"
  backup_window                       = "03:00-06:00"
  backup_retention_period             = local.postgres_backup_retention_period
  subnet_ids                          = local.subnets
  family                              = "postgres12"
  major_engine_version                = "12"
  deletion_protection                 = var.deletion_protection
  multi_az                            = var.postgres_multi_az
  apply_immediately                   = true
  enabled_cloudwatch_logs_exports     = ["postgresql", "upgrade"]
  iam_database_authentication_enabled = true
  parameter_group_name                = aws_db_parameter_group.postgres-12.name
  tags                                = local.tags
}