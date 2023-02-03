
module "codebuild" {
  source                 = "../aws_code_build"
  codebuild_project_name = var.codebuild_project.codebuild_project_name
  image_repo_name        = var.codebuild_project.image_repo_name
  image_tag              = var.codebuild_project.image_tag
}

module "codepipeline" {
  source                  = "../aws_code_pipeline"
  pipeline_name           = var.codepipeline.pipeline_name
  full_repository_name    = var.codepipeline.full_repository_name
  source_repo_branch      = var.codepipeline.source_repo_branch
  codebuild_project_name  = module.codebuild.build_project_name
  codestar_connection_arn = var.codepipeline.codestar_connection_arn
}
