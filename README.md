# Terraform multiple environments - sample modules structure
Sample Terraform project presenting one strategy to create multiple environments, "production" and "staging".

This project contains a single DynamoDB table resource, but the same structure could be used to include more resources.

A S3 backend is used to store the state.

## Deploying the infrastructure
### Staging
```
terraform -chdir="./terraform/environments/staging" init
terraform -chdir="./terraform/environments/staging" apply
```
### Production
```
terraform -chdir="./terraform/environments/production" init
terraform -chdir="./terraform/environments/production" apply
```