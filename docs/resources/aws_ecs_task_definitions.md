---
title: About the aws_ecs_task_definitions Resource
platform: aws
---

# aws\_ecs\_task\_definitions

Use the `aws_ecs_task_definitions` InSpec audit resource to test properties of a plural ECS Task Definitions.

The AWS::ECS::TaskDefinition resource describes the container and volume definitions of an Amazon Elastic Container Service (Amazon ECS) task. You can specify which Docker images to use, the required resources, and other configurations related to launching the task definition through an Amazon ECS service or task.

## Syntax

Ensure that a task definition arns exists.
    describe aws_ecs_task_definitions do
      it { should exist }
    end

## Parameters

For additional information, see the [AWS documentation on ECS Task Definition](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ecs-taskdefinition.html).

## Properties

| Property | Description|
| --- | --- |
| task_definition_arns | A list of arns to describe the task definition. |

## Examples

### Ensure a task definition arns is available.
    describe aws_ecs_task_definitions do
      its('task_definition_arns') { should include 'arn:aws:ecs:us-east-1:<aws_account_id>:task-definition/wordpress:1' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `list_task_definitions` method returns at least one result.

### exist

Use `should` to test that the entity exists.
    describe aws_ecs_task_definitions do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.
    describe aws_ecs_task_definitions do
      it { should_not exist }
    end

### be_available

Use `should` to check if the task definition arns is available.
    describe aws_ecs_task_definitions do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ecs:client:list_task_definitions` action with `Effect` set to `Allow`.