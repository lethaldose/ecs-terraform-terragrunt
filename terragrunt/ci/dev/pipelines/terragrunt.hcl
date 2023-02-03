include "root" {
  path   = find_in_parent_folders("root-config.hcl")
  expose = true
}

include "stage" {
  path   = find_in_parent_folders("stage.hcl")
  expose = true
}

locals {
  # merge tags
  local_tags = {
    "Name" = "ecs-application"
  }

  tags = merge(include.root.locals.root_tags, include.stage.locals.tags, local.local_tags)
}

generate "provider_global" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "s3" {}
  required_version = "${include.root.locals.version_terraform}"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "${include.root.locals.version_provider_aws}"
    }
  }
}

provider "aws" {
  region = "${include.root.locals.region}"
}
EOF
}

inputs = {
  codebuild_project={
    codebuild_project_name = "hello-build"
    image_repo_name        = "ecs-test-ss-repository"
    image_tag              = "latest"
  }

  codepipeline = {
    pipeline_name           = "hello"
    full_repository_name    = "lethaldose/hello-server"
    source_repo_branch      = "main"
    codestar_connection_arn = "arn:aws:codestar-connections:ap-south-1:179522109304:connection/5c486230-e5d6-480f-bd08-cd36d04f216b"
  }
}

terraform {
  source = "${get_parent_terragrunt_dir("root")}/..//terraform/ci_pipeline"
}
