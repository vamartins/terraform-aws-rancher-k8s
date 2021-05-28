data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720010947700"]
}

resource "aws_instance" "publicInstanceRancher" {
  ami                    = data.aws_ami.ubuntu.id
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
  ami                    = data.aws_ami.ubuntu.id
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