resource "aws_cloudwatch_metric_alarm" "sqs_scale_out" {
  alarm_name = "SQS-ScaleOut-${var.ECS_SERVICE_NAME}"

  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "ApproximateNumberOfMessagesVisible"
  namespace                 = "AWS/SQS"
  period                    = "60"
  threshold                 = "1"
  statistic                 = "Sum"
  alarm_description         = "SQS-ScaleOut-${var.ECS_SERVICE_NAME}"
  insufficient_data_actions = []
  alarm_actions = [
  aws_appautoscaling_policy.scale_up_fargate.arn]

  dimensions = {
    QueueName = var.QUEUE_NAME
  }
}

resource "aws_cloudwatch_metric_alarm" "sqs_scale_in" {
  alarm_name          = "SQS-ScaleIn-${var.ECS_SERVICE_NAME}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = "60"
  threshold           = "1"
  statistic           = "Sum"
  alarm_description   = "SQS-ScaleIn-${var.ECS_SERVICE_NAME}"
  alarm_actions = [
  aws_appautoscaling_policy.scale_down_fargate.arn]


  dimensions = {
    QueueName = var.QUEUE_NAME
  }
}
