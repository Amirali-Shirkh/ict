# ict
Infrastructure As Code using Terraform for GCP

## Geting started
How to run: 

1. Export Google access credentials

```
export GOOGLE_APPLICATION_CREDENTIALS= path/to/credentials
```
2. Run terraform init:

```
terraform init -backend-config=./backend.tf
```

3. Run terraform plan

```
terraform plan
```

4. Run terraform apply

```
terraform apply
```

5. Run ansible

```
ansible-playbook --private-key path/to/private-key -i path/to/inventory.yml path/to/roll.yml
```
