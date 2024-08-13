terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
     
    }
  }
}

# Configure the GitHub Provider
provider "github"{
     # token = var.token # or `GITHUB_TOKEN`
}

resource "github_branch" "development1" {
  repository = "python-docs-hello-world"
  branch     = "development1"
  source_branch = "master"
}
