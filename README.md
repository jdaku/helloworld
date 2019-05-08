# About this Repo

## Prerequisites

SCM : Git 

Project management tool : Maven

Automation tool : Jenkins and Ansible

Container : Docker and Kubernetes

Docker image Repository : Docker Hub

Install Docker and Maven using Playbook which located on ansible/installMaven.yml and ansible/installDocker.yml

## Installation Guide 

1. Create Pipeline in Jenkins with below configuration :

	1.1 Setup Maven as *maven3* in Jenkins global Configuration (Here we used external Maven).
	
	1.2 Create credential on jenkins with *"docker-hub-creds"* name for store Docker Image on DockerHub
	
### Running the tests:

```
$ curl <hostname>:30080/hello

Hello World!!
```
