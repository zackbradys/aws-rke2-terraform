resource "aws_instance" "aws_ec2_instance_control" {
  ami           = var.ami_id
  instance_type = var.instance_type_control
  count         = var.number_of_instances_control

  vpc_security_group_ids      = [aws_security_group.aws_rke2_sg.id]
  subnet_id                   = element([aws_subnet.aws_rke2_subnet1.id, aws_subnet.aws_rke2_subnet2.id, aws_subnet.aws_rke2_subnet3.id], count.index % 3)
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = aws_iam_instance_profile.aws_iam_profile_rke2_control.name
  key_name                    = var.key_pair_name

  user_data = templatefile("${var.user_data_control}", {
    DOMAIN = "${var.domain}"
    TOKEN  = "${var.token}"
    vRKE2  = "${var.vRKE2}"
  })

  tags = {
    Name = "${var.instance_name_control}-0${count.index + 1}"
  }

  root_block_device {
    volume_size           = var.volume_size_control
    volume_type           = var.volume_type_control
    encrypted             = var.encrypted
    delete_on_termination = var.delete_on_termination

    tags = {
      Name = "${var.instance_name_control}-volume-0${count.index + 1}"
    }
  }
}

resource "aws_instance" "aws_ec2_instance_controls" {
  ami           = var.ami_id
  instance_type = var.instance_type_controls
  count         = var.number_of_instances_controls

  vpc_security_group_ids      = [aws_security_group.aws_rke2_sg.id]
  subnet_id                   = element([aws_subnet.aws_rke2_subnet1.id, aws_subnet.aws_rke2_subnet2.id, aws_subnet.aws_rke2_subnet3.id], count.index % 3)
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = aws_iam_instance_profile.aws_iam_profile_rke2_control.name
  key_name                    = var.key_pair_name

  user_data = templatefile("${var.user_data_controls}", {
    DOMAIN = "${var.domain}"
    TOKEN  = "${var.token}"
    vRKE2  = "${var.vRKE2}"
  })

  tags = {
    Name = "${var.instance_name_controls}-0${count.index + 1}"
  }

  root_block_device {
    volume_size           = var.volume_size_controls
    volume_type           = var.volume_type_controls
    encrypted             = var.encrypted
    delete_on_termination = var.delete_on_termination

    tags = {
      Name = "${var.instance_name_controls}-volume-0${count.index + 1}"
    }
  }
}

resource "aws_instance" "aws_ec2_instance_worker" {
  ami           = var.ami_id
  instance_type = var.instance_type_worker
  count         = var.number_of_instances_worker

  vpc_security_group_ids      = [aws_security_group.aws_rke2_sg.id]
  subnet_id                   = element([aws_subnet.aws_rke2_subnet1.id, aws_subnet.aws_rke2_subnet2.id, aws_subnet.aws_rke2_subnet3.id], count.index % 3)
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = aws_iam_instance_profile.aws_iam_profile_rke2_worker.name
  key_name                    = var.key_pair_name

  user_data = templatefile("${var.user_data_workers}", {
    DOMAIN = "${var.domain}"
    TOKEN  = "${var.token}"
    vRKE2  = "${var.vRKE2}"
  })

  tags = {
    Name = "${var.instance_name_worker}-0${count.index + 1}"
  }

  root_block_device {
    volume_size           = var.volume_size_worker
    volume_type           = var.volume_type_worker
    encrypted             = var.encrypted
    delete_on_termination = var.delete_on_termination

    tags = {
      Name = "${var.instance_name_worker}-volume-0${count.index + 1}"
    }
  }
}

resource "aws_eip" "aws_eip_control" {
  vpc      = true
  count    = var.number_of_instances_control
  instance = aws_instance.aws_ec2_instance_control[count.index].id

  tags = {
    Name = "${var.instance_name_control}-eip-0${count.index + 1}"
  }
}

resource "aws_eip" "aws_eip_controls" {
  vpc      = true
  count    = var.number_of_instances_controls
  instance = aws_instance.aws_ec2_instance_controls[count.index].id

  tags = {
    Name = "${var.instance_name_controls}-eip-0${count.index + 1}"
  }
}