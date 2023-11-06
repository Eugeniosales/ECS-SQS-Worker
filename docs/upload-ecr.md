# How to upload a image to ECR

## 1) Create repo

```shell
* aws ecr create-repository --repository-name <repo_name> --region <region_name>
```
## 2) Push image to Registry

```shell
* aws ecr get-login-password --region <region_name>
* aws ecr --region <region> | docker login -u AWS -p <encrypted_token> <repo_uri>
* docker tag <source_image_tag> <target_ecr_repo_uri>
* docker push <ecr-repo-uri>
```
