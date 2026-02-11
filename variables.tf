variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "project" {
  description = "Project name (e.g., ai_agent, data_platform)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, stg, prd)"
  type        = string
  default     = "dev"
}

variable "policy_file" {
  description = "Path to policy YAML file relative to module (e.g., ai_agent/prd/infra-policy/vpc.yaml)"
  type        = string
  default     = null
}