resource "aws_appautoscaling_policy" "scale_up_fargate" {
  policy_type        = "StepScaling"
  name               = "sqs-scaling-up-${var.ECS_SERVICE_NAME}"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ExactCapacity"
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_lower_bound = 0
      metric_interval_upper_bound = 5
      scaling_adjustment          = 1
    }
    step_adjustment {
      metric_interval_lower_bound = 5
      metric_interval_upper_bound = 10
      scaling_adjustment          = 2
    }
    step_adjustment {
      metric_interval_lower_bound = 10
      scaling_adjustment          = 3
    }
  }
}

resource "aws_appautoscaling_policy" "scale_down_fargate" {
  policy_type        = "StepScaling"
  name               = "sqs-scaling-down-${var.ECS_SERVICE_NAME}"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ExactCapacity"
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = 0
    }

  }
}
