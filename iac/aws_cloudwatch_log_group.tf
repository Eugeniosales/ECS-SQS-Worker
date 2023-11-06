resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name = "/aws/ecs/v2/${var.ECS_SERVICE_NAME}"
}
