# Extracted from deploy/terraform/aws/network-main.tf (simplified + hardcoded)
resource "aws_vpc" "ds" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-vpc"
  })
}

# Extracted from deploy/terraform/aws/dolphinscheduler-api.tf (SG only, simplified + hardcoded)
resource "aws_security_group" "api" {
  name        = "api"
  description = "Allow incoming connections"
  vpc_id      = aws_vpc.ds.id

  ingress {
    from_port   = 12345
    to_port     = 12345
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH connections (Linux)"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-sg"
  })
}

output "vpc_id" {
  value = aws_vpc.ds.id
}

output "api_security_group_id" {
  value = aws_security_group.api.id
}
