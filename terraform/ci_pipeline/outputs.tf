output "build_project_name" {
  description = "Project name"
  value       = module.codebuild.build_project_name
}

output "build_project_id" {
  description = "Project name"
  value       = module.codebuild.build_project_id
}

output "pipeline_id" {
  description = "CodePipeline id"
  value       = module.codepipeline.pipeline_id
}

output "pipeline_arn" {
  description = "CodePipeline ARN"
  value       = module.codepipeline.pipeline_arn
}
