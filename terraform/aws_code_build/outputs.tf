output "build_project_name" {
  description = "Project name"
  value       = aws_codebuild_project.codebuild_project.name
}

output "build_project_id" {
  description = "Project id"
  value       = aws_codebuild_project.codebuild_project.id
}
