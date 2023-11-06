resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 3
  min_capacity       = 0
  resource_id        = "service/${aws_ecs_cluster.ecs_worker_cluster.name}/${aws_ecs_service.ecs_worker_ecs_service.name}"
  role_arn           = data.aws_iam_role.ecs_autoscaling_role.arn
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}
