## Setting up
Follow these steps to set up Terraform Cloud management:

1. **Create a workspace**
- In your organization, create a workspace called `setup` as CLI-Driven Workflow.

2. **Add variables:**
- Inside the `setup` workspace, add the following variables:

    - `TFE_ORGANIZATION`: Set this value to your organization name
    - `TFE_TOKEN`: This variable should be marked as sensitive. Generate a user token in your account settings under `Tokens` and use the generated API Token as the value for this variable.

3. **Update Backend Configuration:**
- Update the placeholder in backend.tf in tfcloud directory as the following:
```
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "<YOUR_ORGANIZATION_NAME>"

    workspaces {
      name = "setup"
    }
  }
}
```

4. **Version Control Configuration**
- Configure the version control to point to this repository and directory `tfcloud`.

5. **Modify Configurations**
- Adjust the following configurations:
    - `VCS Triggers`: Configure VCS triggers to only trigger runs when files in scpecified paths change. Set the prefix to `tfcloud/**/*.tf`
    - `VCS Branch`: Set the VCS branch to main
    - `Automatic Speculative Plans`: Enable automatic speculative plans for improved workflow efficiency.