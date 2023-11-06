resource "aws_security_group" "ecs_worker_security_group" {
  name        = "ecs-worker-sg"
  description = "ECS ecs worker SG"
  vpc_id      = var.VPC_ID

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = var.PROJECT
  }
}
