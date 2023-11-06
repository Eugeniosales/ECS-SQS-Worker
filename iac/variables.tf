variable "ENV" {
  type        = string
  description = "Application environment"
  default     = "dev"
}

variable "REGION" {
  type        = string
  description = "region"
  default     = null
}


variable "PROJECT" {
  type        = string
  description = "aws-terraform-basis"
  default     = "aws-terraform-basis"
}

variable "VPC_ID" {
  type        = string
  description = "VPC ID"
  default     = null
}

variable "SUB_NET_01" {
  type        = string
  description = "sub net a"
  default     = null
}

variable "SUB_NET_02" {
  type        = string
  description = "sub net b"
  default     = null
}

variable "TASK_IMAGE" {
  type        = string
  description = "task image"
  default     = null
}

variable "ECS_SERVICE_NAME" {
  type        = string
  description = "service name"
  default     = null
}

variable "ECS_CLUSTER_NAME" {
  type        = string
  description = "cluster name"
  default     = null
}

variable "ECS_TASK_CPU" {
  type        = string
  description = "ecs task cpu"
  default     = null
}

variable "ECS_TASK_MEMORY" {
  type        = string
  description = "ecs task memory"
  default     = null
}

variable "QUEUE_NAME" {
  type        = string
  description = "queue name"
  default     = null
}
