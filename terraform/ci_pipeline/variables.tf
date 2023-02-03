variable "codebuild_project" {
  type = object({
    codebuild_project_name = string
    image_repo_name        = string
    image_tag              = string
  })
}

variable "codepipeline" {
  type = object({
    pipeline_name           = string
    full_repository_name    = string
    source_repo_branch      = string
    codestar_connection_arn = string
  })
}
