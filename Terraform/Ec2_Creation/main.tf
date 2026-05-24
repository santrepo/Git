
resource "aws_instance" "example" {
    ami           = var.ami_value  
    instance_type = var.instance_type_value
    associate_public_ip_address = "true"
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.vpc_sg_id]
    key_name = var.ssh_key

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("instance1sshkey.pem")
      host = self.public_ip
    }

    provisioner "file" {
    source      = "app.py"  # Replace with the path to your local file
    destination = "/home/ubuntu/app.py"  # Replace with the path on the remote instance
  }

   provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip",  # Example package installation
      "cd /home/ubuntu",
      "sudo apt install python3-flask -y",
      "sudo python3 app.py",
    ]
  }
}


