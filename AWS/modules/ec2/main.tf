# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "main" {
  algorithm = var.key-pair-algorithm
  rsa_bits  = var.key-pair-rsa-bits
}
# Create the Key Pair
resource "aws_key_pair" "main" {
  key_name   = var.key-pair-name 
  public_key = tls_private_key.main.public_key_openssh
}
# Save file
resource "local_file" "ssh-key" {
  filename = "${aws_key_pair.main.key_name}.pem"
  content  = tls_private_key.main.private_key_pem
}

# Get latest Windows Server 2022 AMI
data "aws_ami" "windows-2022" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
}

# Bootstrapping PowerShell Script
data "template_file" "main" {
  template = <<EOF
<powershell>
# Rename Machine
New-NetFirewallRule –DisplayName "Allow ICMPv4-In" –Protocol ICMPv4;
</powershell>
EOF
}

# Define the security group for the Windows server
resource "aws_security_group" "main" {
  name        = var.security-group-name
  description = "Allow incoming connections"
  vpc_id      = var.vpc-id
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }
    ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ICMP for connectivity testing"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.security-group-name
  }
}

# EC2 Instance
resource "aws_instance" "main" {
  count = length(var.windows-instance-name)
  ami = data.aws_ami.windows-2022.id
  instance_type = var.windows-instance-type
  subnet_id = var.subnet-id[count.index]
  vpc_security_group_ids = [ aws_security_group.main.id ]
  source_dest_check = false
  key_name = aws_key_pair.main.key_name
  user_data = data.template_file.main.rendered
  associate_public_ip_address = var.windows-associate-public-ip-address

  # Root disk
  root_block_device {
    volume_size = var.windows-root-volume-size
    volume_type = var.windows-root-volume-type
    delete_on_termination = true
    encrypted = true
  }

  # Extra disk
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = var.windows-data-volume-size
    volume_type = var.windows-data-volume-type
    delete_on_termination = true
    encrypted = true
  }

  tags = {
    Name = var.windows-instance-name[count.index]
  }
}

# Create Elastic IP for the EC2 instance
resource "aws_eip" "main" {
  count = length(var.windows-instance-name)
  vpc  = true
  tags = {
    Name = "${var.windows-instance-name[count.index]}-eip"
  }
}
# Associate Elastic IP to Windows Server
resource "aws_eip_association" "main" {
  count = length(var.windows-instance-name)
  instance_id   = aws_instance.main[count.index].id
  allocation_id = aws_eip.main[count.index].id
}

