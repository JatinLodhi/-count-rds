# Provider information.

provider "aws" {
  region  = "us-east-1"
  profile = "KS-profile"
}



resource "aws_db_instance" "default" {
  count = 2  
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  tags = {
    Name = "Database ${count.index}"
  }
}

