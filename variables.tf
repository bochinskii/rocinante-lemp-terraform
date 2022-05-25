#
# Userd data variables
#
variable "hostname" {
  type = string
  default = "rocinante"
}
variable "timezone" {
  type = string
  default = "Europe/Berlin"
}
variable "ssh_port" {} # for user data and aws_security_group
variable "mysql_repo" {
  type = string
  default = "https://dev.mysql.com/get/mysql80-community-release-el7-6.noarch.rpm"
}
variable "mysql_root_pass" {}
variable "mysql_admin_user" {}
variable "mysql_admin_user_pass" {}
variable "mysql_drupal_user" {}
variable "mysql_drupal_user_pass" {}
variable "mysql_drupal_db" {}
variable "pkgs" {
  type = list(string)
  default = [
    "php", "php-fpm", "php-pdo", "php-mysqlnd", "php-xml", "php-gd", "php-curl",
    "php-mbstring", "php-json", "php-common", "php-gmp", "php-intl", "php-gd", "php-cli", "php-zip", "php-opcache"
  ]
}
variable "ssl_cert" {
  type = string
  default = "rocinante.crt"
}
variable "ssl_key" {
  type = string
  default = "rocinante.key"
}
variable "site_dir" {}
variable "site_config" {
  type = string
  default = "rocinante.conf"
}

variable "archive_name" {
  default = "rocinante_220503.tar.bz"
}
variable "db_dump_name" {
  default = "rocinante_db_220503.sql.bz"
}
variable "db_dump_name_only" {
  default = "rocinante_db_220503.sql"
}

# aws_instance variables

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "bochinskii_Frankfurt_2"
}


####### root_block_device variables

variable "volume_type" {
  type = string
  default = "gp3"
}

variable "volume_size" {
  type = number
  default = 10
}

# tags

variable "template_tags" {
  type = map
  default = {
    Owner = "Denis Bochinskii"
    Project = "rocinante"
    Env = "dev"
  }
}
