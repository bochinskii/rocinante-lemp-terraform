
resource "aws_instance" "rocinante" {
  ami = data.aws_ami.amazon_linux_2_5_latest.image_id
  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.rocinante_web.id,
    aws_security_group.rocinante_ssh.id
  ]

  subnet_id = data.aws_subnets.subnets.ids[0]

  user_data_base64 = base64encode(templatefile("./user_data.sh.tftpl",
  {
    hostname = var.hostname,
    timezone = var.timezone,
    ssh_port = var.ssh_port,
    mysql_repo = var.mysql_repo,
    mysql_root_pass = var.mysql_root_pass,
    mysql_admin_user = var.mysql_admin_user,
    mysql_admin_user_pass = var.mysql_admin_user_pass,
    mysql_drupal_user = var.mysql_drupal_user,
    mysql_drupal_user_pass = var.mysql_drupal_user_pass,
    mysql_drupal_db = var.mysql_drupal_db,
    pkgs = var.pkgs,
    ssl_cert = var.ssl_cert,
    ssl_key = var.ssl_key,
    site_dir = var.site_dir,
    site_config = var.site_config,
    archive_name = var.archive_name,
    db_dump_name = var.db_dump_name,
    db_dump_name_only = var.db_dump_name_only
  }
  ))

  user_data_replace_on_change = true

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    delete_on_termination = true
  }

  provisioner "file" {
    source      = "./configs"
    destination = "/home/ec2-user"

    connection {
      type  = "ssh"
      user  = "ec2-user"
      host  = self.public_ip
      port  = var.ssh_port
      private_key = file("./secret/bochinskii_Frankfurt_2.pem")
    }
  }

  provisioner "file" {
    source      = "./data"
    destination = "/home/ec2-user"

    connection {
      type  = "ssh"
      user  = "ec2-user"
      host  = self.public_ip
      port  = var.ssh_port
      private_key = file("./secret/bochinskii_Frankfurt_2.pem")
    }
  }

  tags = merge(
    var.template_tags,
    {
      Name = "rocinante_${var.template_tags["Env"]}"
    }
  )
}

resource "aws_security_group" "rocinante_web" {
  name        = "rocinante-web"
  description = "Allow Web traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description      = "To HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "To HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.template_tags,
    {
      Name = "rocinante_web_${var.template_tags["Env"]}"
    }
  )

}

resource "aws_security_group" "rocinante_ssh" {
  name        = "rocinante-ssh"
  description = "Allow ssh traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description      = "To custome SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.template_tags,
    {
      Name = "rocinante_ssh_${var.template_tags["Env"]}"
    }
  )

}
