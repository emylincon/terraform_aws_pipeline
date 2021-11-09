# terraform_aws_pipeline

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
