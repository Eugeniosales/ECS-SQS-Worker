resource "aws_ecs_service" "ecs_worker_ecs_service" {
  name            = var.ECS_SERVICE_NAME
  cluster         = aws_ecs_cluster.ecs_worker_cluster.id
  task_definition = aws_ecs_task_definition.ecs_worker_task_definition.arn
  desired_count   = 0
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [var.SUB_NET_01, var.SUB_NET_02]
    security_groups  = [aws_security_group.ecs_worker_security_group.id]
  }
}
