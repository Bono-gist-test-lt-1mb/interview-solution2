# README.md for interview problem solution

## Problem Description

### The problem description can be found in the file:

revised-operability-take-home.pdf

As there is no copyright statement in this file I have not included it in this repo.

### A summary of the problem statement could be:

Minikube
Write a simple hello world application in any one of these languages: Python, Ruby, Go. Build the application within a Docker container and then load balance the application within minikube.
You are not required to automate the installation of minikube on the host machine

## File inventory

| Filename    | Comments                                           |
| ----------- | -------------------------------------------------- |
| Dockerfile  | Docker file to build image.                        |
| LICENSE     | MIT License file                                   |
| README.MD   | This README.MD                                     |
| hello-chart | helm chart (folder) for helm deployment.           |
| main.py     | The api code which is built into the docker image. |

## Installation

*Open a termianl and clone the git repo*

`git clone https://github.com/Bono-gist-test-lt-1mb/interview-solution.git`     

## Build the docker image

*cd into the folder created*

`cd interview-solution`

*You will need a docker image repo named hello created*

*Build the image*

docker build -t  <your repo path>/hello:v1.0.0 .

*Push the image*

docker push <your repo path>/hello:v1.0.0

## Modify the helm chart to use your newly built image

IMAGE is comprised of two parts: REPO:TAG

In hello-chart.values.yaml 

1. on line 8 change REPO to <your repo path>/hello

2. on line 11 change TAG to v1.0.0

3. save the file & exit.

## Deploy to minikube

It is assumed that you have minikube set up and can issue kubectl and helm commands to it.

*Verify you are in the root folder of the cloned git repo and then execute helm upgrade*

helm upgrade -i  hello-chart ./hello-chart

**I prefer to use "upgrade -i"" as this will either upgrade the one that is there or do a fresh install if there is not one there. When I script deployments I use this as it covers all cases of is it already there or not.**

## For minikube set up minikube tunnel

*IN another shell execute minikube tunnel*

**This must be left running for the loadbalancer to work under minikube**

## Verify service is up
```
kubectl get svc
NAME          TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
hello-chart   LoadBalancer   10.109.43.132   <pending>     8080:31812/TCP   32s
```
**it may be in pending for a minute**

*Check again*
```
kubectl get svc
NAME          TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
hello-chart   LoadBalancer   10.109.43.132   127.0.0.1     8080:31812/TCP   1m22s
```
**On my mac it took literally a minute to become "ready"**

## Hit http://localhost:8080 with yor browser

(or if localhost is not defined on your system use http://127.0.0.1:8080 )

*Observe text*  "Hello World!" and it is done.



## Version Information

| Version Name | Release Date | Semantic Version | Comments |
| ------------ | ------------ | ---------------- | -------- |
| Initial      | 24-Oct-2023  | 1.0.0            |          |
|              |              |                  |          |

## Author

*Author info goes here*
