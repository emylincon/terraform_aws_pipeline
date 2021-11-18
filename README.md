# terraform_aws_pipeline
This creates a aws code pipeline using terraform that is deployed in ECS

## To run
* first export aws credentials to environment variables
```
export AWS_ACCESS_KEY_ID="AXXXXXXX"
export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXX"
export AWS_DEFAULT_REGION="eu-west-1"
```
* create ssh keys for login
```
ssh-keygen -t rsa
```
* Initialize terraform workspace
```
terraform init
```
* deploy pipline
```
terraform apply
```

## Configure git codecommit credentials
```
aws configure  # fill in credentials
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true
```

## git commit and push
```
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/lab-repository
git add .
git commit -m "Initial Commit"
git push origin master
```
## Youtube Video demonstration
[Youtube link](https://youtu.be/nm16l3YN6ps)

## Workspaces
```
terraform workspace list
```
```
terraform workspace create 
```