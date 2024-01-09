resource "aws_instance" "jumpbox" {
  ami                         = "ami-093467ec28ae4fe03"
  instance_type               = "t2.micro"
  key_name                    = "jumpbox-key-pair"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.jumpbox_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "jumpbox-instance"
  }
}

resource "aws_security_group" "jumpbox_sg" {
  name   = "jumpbox-sg"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "jumpbox_sg_from_all" {
  security_group_id = aws_security_group.jumpbox_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jumpbox_sg_to_all" {
  security_group_id = aws_security_group.jumpbox_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
