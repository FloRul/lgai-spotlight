output "vpc_id" {
  value = module.vpc.vpc_id
}

output "db_info" {
  value = {
    "db_name"     = var.db_name
    "db_host"     = aws_db_instance.vector_db.address
    "db_port"     = aws_db_instance.vector_db.port
    "db_username" = aws_db_instance.vector_db.username
    "db_adsress"  = aws_db_instance.vector_db.address
  }
}
