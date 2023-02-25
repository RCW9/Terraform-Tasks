# Introducing Terraform

The purpose of this sprint is to give you a first look at Terraform, a tool for creating Infrastructure as Code.

First you will need to install Terraform on your machine. Use the instructions [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

You can test Terraform is installed by typing `which terraform`.

You may find it useful to install the `HashiCorp Terraform` extension on VSCode to help with syntax.

## Crash course
You will need to set up a sandbox and CLI credentials in the shell in which you are working. If the AWS CLI can access the sandbox from your shell session, so should Terraform.

Terraform resources are defined in files whose names usually end in `.tf`. 

To Initialise Terraform `cd` into the same directory as the `.tf` files, then type:
```bash
terraform init
```

You can test whether your Terraform resources define valid infrastructure by typing:
```bash
terraform plan
```
This does not guarantee success, but you can check whether the list of items being prepared for creation is as you expect.

When you are satisfied, deploy the items:
```bash
terraform apply
```

You will see that a file called something like `terraform.tfstate` has been created in the folder. This is the "state" file which contains a list of the various items created and their relationships. It is really important that you do not edit or delete this file or Terraform will lose track of what it has done.

You can change the definition of the items and then run `plan` and `apply` again to modify the deployment.

When you are finished, you can take down the deployment:
```bash
terraform destroy
```

## The Tasks
There are two tasks. The first requires you to build an S3 bucket containing a file object. The second requires you to create a very simple Lambda.

You will need to run separate instances of Terraform for each task - in other words, run `terraform init` and the other commands within the task folders, not from the root folder of the project.

Details of each task are included in the respective folders. In each case the project structure is already set up. You just need to use the Terraform documentation to help you implement the missing resources.
