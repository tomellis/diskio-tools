IOZone and Bonnie++ Docker container on Ubuntu base image for testing diskio

You can run this using the task-definition on ECS, public image in ECR Public Gallery or your preferred orchestrator.

Public Image: https://gallery.ecr.aws/p0b2w3k8/diskio-tools

## Docker CLI

docker run -it public.ecr.aws/p0b2w3k8/diskio-tools:latest

## ECS - RunTask (one time execution) on existing cluster

aws ecs register-task-definition --cli-input-json file://task-definition.json

## ECS with CDK

You could also spin this up with CDK etc. Use an existing example!
