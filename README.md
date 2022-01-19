IOZone and Bonnie++ Docker container on Ubuntu base image for testing diskio

You can run this using the task-definition on ECS, public image in ECR Public Gallery or your preferred orchestrator.

Public Image: https://gallery.ecr.aws/p0b2w3k8/diskio-tools

## Docker CLI

```
docker run -it public.ecr.aws/p0b2w3k8/diskio-tools:latest
```

## ECS - RunTask (one time execution) on existing cluster called fargate with a capacity provider called FARGATE_SPOT

```
aws ecs register-task-definition --cli-input-json file://task-definition.json
aws ecs run-task --cluster fargate --task-definition diskio-taskdef-fargate:1 --network-configuration "awsvpcConfiguration={subnets=[subnet-example1,subnet-example2,subnet-example3],securityGroups=[sg-example]}" --capacity-provider-strategy="capacityProvider=FARGATE_SPOT" --overrides="containerOverrides={name=diskio-tools,command=[\"/usr/local/sbin/bonnie++\",\"-u\",\"root\"]}
```

## ECS with CDK

You could also spin this up with CDK etc. Use an existing example!
