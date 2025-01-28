/*
resource "aws_db_instance" "finance-db-instance" {
    allocated_storage    = 10
    engine               = "postgres"
    engine_version       = "11.22"
    identifier           = "finance-postgres-db"
    instance_class       = "db.t3.micro"
    db_name              = var.db_name
    username             = var.db_user
    password             = var.db_password
    skip_final_snapshot  = true
    storage_encrypted    = false
    publicly_accessible  = false
    apply_immediately    = true
    port = var.db_port
    vpc_security_group_ids = [aws_security_group.sg_private.id]
    db_subnet_group_name   = aws_db_subnet_group.private_subnet_group.name

    tags = {
      Name = "Finance Database"
    }
  }
  */