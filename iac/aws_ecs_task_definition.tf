resource "aws_ecs_task_definition" "ecs_worker_task_definition" {
  family                   = var.ECS_SERVICE_NAME
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.ECS_TASK_CPU
  memory                   = var.ECS_TASK_MEMORY
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.task_role.arn

  container_definitions = jsonencode([
    {
      name  = "ecs-worker-app"
      image = var.TASK_IMAGE,
      essential = true,
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-region        = var.REGION,
          awslogs-group         = "${aws_cloudwatch_log_group.ecs_log_group.name}",
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  depends_on = [
    aws_cloudwatch_log_group.ecs_log_group
  ]
}
