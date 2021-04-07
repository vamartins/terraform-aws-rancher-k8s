resource "aws_instance" "publicInstanceRancher" {
  ami                    = var.ami
  instance_type          = var.instanceTypeRancher
  key_name               = var.keyName
  vpc_security_group_ids = [aws_security_group.awslab-sg-public.id]
  user_data              = file("rancher.sh")
  subnet_id              = aws_subnet.public_subnet.id

  tags = {
    Name        = var.instanceNamePublicRancher
    Environment = var.env
    Provisioner = var.Provisioner
  }
}

resource "aws_instance" "publicInstanceK8s" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instanceTypeK8s
  key_name               = var.keyName
  vpc_security_group_ids = [aws_security_group.awslab-sg-public.id]
  user_data              = file("k8s.sh")
  subnet_id              = aws_subnet.public_subnet.id

  tags = {
    Name        = "awslab-instance-k8s-${count.index + 1}"
    Environment = var.env
    Provisioner = var.Provisioner
  }
}