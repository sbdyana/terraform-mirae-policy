output "policy" {
  description = "Policy Contents"
  value       = local.policy
}

output "base_name" {
  description = "value"
  value       = local.base_name
}

output "default_tags" {
  description = "Default tags to apply to all resources"
  value       = local.default_tags
}

output "iam_path" {
  description = "Path to IAM policy JSON files"
  value       = local.iam_path
}