#commands to create github repo using terrform
# 1. "terraform init"
# 2. "terraform apply" or "terraform apply --auto-approve=true"
# to destroy repos use command
# 3. "terraform destroy --auto-approve=true"
# to delete specific resource run "terraform destroy --target github_repository.second_repo"

/*

resource "github_repository" "github_repo" {
    name = "first-repo-using-terraform"
    description = "github repo created using terraform"
    visibility = "public"
    auto_init = true
}

*/

resource "github_repository" "second_repo" {
  name        = "second-repo-using-terraform"
  description = "second github repo created using terraform"
  visibility  = "private"
  auto_init   = true
}


resource "github_repository" "terraform_repo" {
  name        = "terraform"
  description = "Repo for terraform created using terraform"
  visibility  = "private"
  auto_init   = true
}

output "terraform_repo_url" {
  value = github_repository.terraform_repo.html_url
}