terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "git_deborah"

    workspaces {
      name = "setup"
    }
  }
}
