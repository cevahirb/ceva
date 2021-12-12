resource "aws_security_group" "sg-to-sg" {
  name        = "Sg-cevaCluster"
  description = "Cluster traffic"
  vpc_id      = "vpc-3ef9285b"


  egress {
    description = "cevaCluster"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "cevaCluster"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }
}

output "sg_id" {
value = aws_security_group.sg-to-sg.id
}
