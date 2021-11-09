
# output "code_build_project" {
#   value = aws_codebuild_project.containerAppBuild.arn
# }

# output "python_app_codepipeline_project" {
#   value = aws_codepipeline.python_app_pipeline.arn
# }

output "code_commit_repo" {
  value = aws_codecommit_repository.code_repo.clone_url_http
}

output "elb" {
  value = aws_lb.loadbalancer.dns_name
}

