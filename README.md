
### Building CI/CD pipelines with GitLab, .NET5, and Docker Hub
Detail step by step guide here: https://www.linkedin.com/pulse/building-cicd-pipelines-gitlab-net-5-docker-hub-ᴍᴄᴘ-ᴄsᴍ-ᴄsᴘᴏ/
### Docker file configuration for multy layer .NET app and CI/CD with GitLab 
### Runner Registration
```
1.gitlab-runner.exe register
https://gitlab.com/
2.Enter the registration token (under gitlab repository settings>CI/CD>Runners)
3.Enter tags Like(ci, ssh, docker)
4.Enter the default Docker image (for example, ruby:2.6):
docker_net5:1.0
```
## build image
docker build -t gitlabdocker .
docker build -t gitlabdocker:latest .
docker build -t docker.io/khairul100/gitlabdocker:latest .
# with version
docker build -t gitlabdocker:v1 . 
# with a name prefix
docker build -t khairul100/gitlabdocker .
docker build -t khairul100/gitlabdocker:latest .
docker build -t khairul100/gitlabdocker:v1 .
## docker push
docker push khairul100/gitlabdocker:latest
docker push docker.io/khairul100/gitlabdocker:latest
## check available images
docker images
## create and run container 
docker run -p 18152:80 -p 44391:443 gitlabdocker:latest
docker run --name gitlabdocker -p 18152:80 -p 44391:443 gitlabdocker:latest
docker run -p 39177:80 -p 44391:443 khairul100/gitlabdocker:latest
docker run --name gitlabdocker -p 18152:80 -p 44391:443 khairul100/gitlabdocker:latest
# with name & image named version
docker run --name gitlabdocker-con -p 18152:80 -p 44391:443 gitlabdocker:v1
# with name & image latest version 
docker run --name gitlabdocker-con -p 18152:80 -p 44391:443 gitlabdocker

http://localhost:18152/weatherforecast
https://localhost:44391/weatherforecast

```
### Run with Docker Compose
```
docker-compose -f .\docker-compose.yml -f .\docker-compose.override.yml up -d 
# OR
docker-compose -f .\docker-compose.yml -f .\docker-compose.override.yml up -d --scale app=5
```
