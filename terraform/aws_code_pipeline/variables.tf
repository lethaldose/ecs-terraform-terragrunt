variable "pipeline_name" {
  description = "Name for CodePipeline"
}

variable "full_repository_name" {
  type        = string
  description = "orgname/reponame"
}

variable "source_repo_branch" {
  type        = string
  description = "branch name"
}

variable "codebuild_project_name" {
  type        = string
  description = "codebuild project name"
}

variable "codestar_connection_arn" {
  type        = string
  description = "codestar connection arn"
}
