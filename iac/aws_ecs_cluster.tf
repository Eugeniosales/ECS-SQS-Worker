resource "aws_ecs_cluster" "ecs_worker_cluster" {
  name = var.ECS_CLUSTER_NAME
}
