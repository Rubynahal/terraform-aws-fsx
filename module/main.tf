resource "aws_security_group" "fsx_sg" {
  name        = "${var.prefix}-${var.name}"
  description = "FSx security group for ${var.prefix}-${var.name}"
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port            = 5985
    to_port              = 5985
    protocol             = "tcp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 53
    to_port              = 53
    protocol             = "tcp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 53
    to_port              = 53
    protocol             = "udp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 49152
    to_port              = 65535
    protocol             = "udp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 49152
    to_port              = 65535
    protocol             = "tcp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 88
    to_port              = 88
    protocol             = "tcp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 88
    to_port              = 88
    protocol             = "udp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 445
    to_port              = 445
    protocol             = "tcp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 445
    to_port              = 445
    protocol             = "udp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 389
    to_port              = 389
    protocol             = "tcp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 389
    to_port              = 389
    protocol             = "udp"
    security_groups      = var.fsx_client_sgids
  }

  ingress {
    from_port            = 636
    to_port              = 636
    protocol             = "tcp"
    security_groups      = var.fsx_client_sgids
  }

  tags                    = merge(
    {
    Name                  = "${var.prefix}-${var.name}"
    },
    var.tags
  )
}


resource "aws_fsx_windows_file_system" "fsx" {
  active_directory_id               = var.managed_ad_id
  kms_key_id                        = var.fsx_kms_key
  storage_capacity                  = var.storage_capacity
  storage_type                      = var.storage_type
  subnet_ids                        = var.subnet_ids
  throughput_capacity               = var.throughput_capacity
  automatic_backup_retention_days   = var.automatic_backup_retention_days
  tags                              = var.tags
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  weekly_maintenance_start_time     = var.weekly_maintenance_start_time
  copy_tags_to_backups              = var.copy_tags_to_backups
  deployment_type                   = var.deployment_type
  preferred_subnet_id               = var.preferred_subnet_id
  security_group_ids                = [aws_security_group.fsx_sg.id]
}

