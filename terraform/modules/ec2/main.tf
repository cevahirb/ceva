resource "aws_network_interface" "masterip" {
  subnet_id   = "subnet-5eff763b"
  private_ips = ["172.31.17.221"]
  security_groups = [ var.sg_id ]

  tags = {
    Name = "Masterprimary_network_interface"
  }
}

resource "aws_instance" "master" {
  ami           = "ami-09e3b6f4d37792791"
  instance_type = "t2.medium"
  key_name = "cevcev"
  network_interface {
    network_interface_id = aws_network_interface.masterip.id
    device_index         = 0
  }
  user_data = <<EOF
  #! /bin/bash
  sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCXwmzVo4oe/gZnDGBmypQNxKE8v+QJqdH7cj+tXFGSfpRvapsxhFehhIZFFtvubgJ+fWZiZ1gZogjg+lqX6Q3plfGK+8ifRl2soUn9/md8DG27coqM0qHBm9P1PiEik/psOp/gUYOGW7Lo2EbqmGRHDcI7/vbAWMAVuS3OjQAc54tkWgVrBDi79rc/PWvhJ2tOfImwcOmwAng2f4p+6j/dWd5xc/zhWc1SW0iVpRAx/dHY5mJ1u5A4UUchos4YaMLSgz8/Qx8X0rUSfWnMSdSoCjEfNyjGdMJ6QBDWhhgE7mmlveol/PkPJoHu8ImX1oTUioRAZt+dHcjPU6mHMWRFnIljRgHP2jz1jhYmcOoDPsyjKokdnPEpZ9lJ0OmcQWePg2T04Wja5MVjc0/gTzgQbDmWwEhT640Vl4Fd4nU6OznpPl0+jyCkZjSRxGNjb8Fmcx1ULtCCRylkv7hWGux8rHFNaNh6tdPxHBtDw4E52XmIJ6de1vk7OBSDEQoShoU= ubuntu@ip-172-31-17-210" >> /home/ubuntu/.ssh/authorized_keys
  EOF
  tags = var.default_tags_master

}
### Worker Installation

resource "aws_network_interface" "workerip" {
  subnet_id   = "subnet-5eff763b"
  private_ips = ["172.31.17.222"]
  security_groups = [ var.sg_id ]
  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "worker" {
  ami           = "ami-09e3b6f4d37792791"
  instance_type = "t2.medium"
  key_name = "cevcev"
  network_interface {
    network_interface_id = aws_network_interface.workerip.id
    device_index         = 0
  }
    user_data = <<EOF
  #! /bin/bash
  sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCXwmzVo4oe/gZnDGBmypQNxKE8v+QJqdH7cj+tXFGSfpRvapsxhFehhIZFFtvubgJ+fWZiZ1gZogjg+lqX6Q3plfGK+8ifRl2soUn9/md8DG27coqM0qHBm9P1PiEik/psOp/gUYOGW7Lo2EbqmGRHDcI7/vbAWMAVuS3OjQAc54tkWgVrBDi79rc/PWvhJ2tOfImwcOmwAng2f4p+6j/dWd5xc/zhWc1SW0iVpRAx/dHY5mJ1u5A4UUchos4YaMLSgz8/Qx8X0rUSfWnMSdSoCjEfNyjGdMJ6QBDWhhgE7mmlveol/PkPJoHu8ImX1oTUioRAZt+dHcjPU6mHMWRFnIljRgHP2jz1jhYmcOoDPsyjKokdnPEpZ9lJ0OmcQWePg2T04Wja5MVjc0/gTzgQbDmWwEhT640Vl4Fd4nU6OznpPl0+jyCkZjSRxGNjb8Fmcx1ULtCCRylkv7hWGux8rHFNaNh6tdPxHBtDw4E52XmIJ6de1vk7OBSDEQoShoU= ubuntu@ip-172-31-17-210" >> /home/ubuntu/.ssh/authorized_keys
  EOF
  tags = var.default_tags_worker

}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.worker.id
  allocation_id = "0c52c94f73b318302"
}

