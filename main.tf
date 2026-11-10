#Configuracion del proovedor de AWS
provider "aws" {
  region = "us-east-1"
}

#creamos el security group
resource "aws_security_group" "mi-sg" {
  name = "misecurity-group-terraform"
  description = "security-group para mi instania terraform"
  vpc_id = "vpc-09c664feeb8b1e968"

  # RDP para Windows
ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]

}

#regla de salida para HTTP
ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]

}
}




#declaracion de los recursos de AWS
resource "aws_instance" "mi_instancia_3_windows" {
    ami = "ami-06ec7afea7c5d1693"
    instance_type = "t3.medium"
    key_name = "mi-primera-llaves-je"
    tags = {
      Name= "MiInstanciaTerraform3"
    }
    vpc_security_group_ids = [ aws_security_group.mi-sg.id ]
}