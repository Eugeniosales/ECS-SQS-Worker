# How to upload a image to Docker Hub

## 1) Pull and update an image

```docker
* sudo docker pull ubuntu
* sudo docker run -it -d ubuntu
* sudo docker exec -it $ubuntu_container_id bash
* mkdir folderTest
* exit
* sudo docker commit $ubuntu_container_id eugeniosales/teste-image:1
```

## 2) From custom Docker file

```docker
* set up a Dockerfile
* sudo docker build -t eugeniosales/node-ecs-worker .
* sudo docker run -it -d eugeniosales/node-ecs-worker
* sudo docker commit $eugeniosales/node-ecs-worker_container_id
```

## 3) Create an account in Docker Hub

- https://hub.docker.com/

## 4) Push image to Registry

```docker
* sudo docker login
* sudo docker push eugeniosales/node-ecs-worker
```