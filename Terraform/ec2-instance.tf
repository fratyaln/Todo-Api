resource "aws_instance" "jenkins" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"  

  key_name      = "my-key-pair"  
  security_groups = ["jenkins_sg"]  

  tags = {
    Name = "JenkinsServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y openjdk-11-jdk
              sudo apt install -y wget
              wget -q -O - https://pkg.jenkins.io/keys/jenkins.io.key | sudo tee -a /etc/apt/trusted.gpg.d/jenkins.asc
              echo "deb http://pkg.jenkins.io/debian/ jenkins.io" | sudo tee -a /etc/apt/sources.list.d/jenkins.list
              sudo apt update
              sudo apt install -y jenkins
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              EOF


  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]


  associate_public_ip_address = true
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Security group for Jenkins server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
