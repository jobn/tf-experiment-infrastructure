## Terraform Infrastructure as Code

This repository contains a Terraform configuration for deploying a simple Cloud Run application.

### Github Actions authentication

https://github.com/google-github-actions/auth/tree/v2/?tab=readme-ov-file#workload-identity-federation-through-a-service-account

Impersonating a service account is needed to get permissions on the storage api.

### Store Terraform state in gcloud bucket

https://cloud.google.com/docs/terraform/resource-management/store-state

