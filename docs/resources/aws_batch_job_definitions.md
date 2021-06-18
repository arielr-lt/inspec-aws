---
title: About the aws_batch_job_definitions Resource
platform: aws
---

# aws\_batch\_job\_definitions

Use the `aws_batch_job_definitions` InSpec audit resource to test properties of the multiple batch job definitions.

The AWS::Batch::JobDefinition resource specifies the parameters for an AWS Batch job definition.

## Syntax

Ensure that a job definition exists.

    describe aws_batch_job_definitions do
      it { should exist }
    end

## Parameters

For additional information, see the [AWS documentation on Batch Job Definition](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-athena-workgroup.html).

## Properties

| Property | Description|
| --- | --- |
| job_definition_names | The name of the job definition. |
| job_definition_arns | The ARN of the job definition. |
| revisions | The revision of the job definition. |
| statuses | The status of the job definition. |
| types | The type of the job definition. |
| parameters | The parameter of the job definition. |
| tags | The tags of the job definition. |
| propagate_tags | Whether to propagate tags from the job definition to the ECS task. |
| platform_capabilities | The platform capabilities required by the job definition. |

## Examples

### Ensure a job definition name is available.

    describe aws_batch_job_definitions do
      its('job_definition_names') { should include 'JOB_DEFINITION_NAME' }
    end

### Ensure that the status is `ACTIVE`.

    describe aws_batch_job_definitions do
        its('statuses') { should include 'ACTIVE' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of the available matchers, please visit our [Universal Matchers page](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-batch-jobqueue.html).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_batch_job_definitions do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_batch_job_definitions do
      it { should_not exist }
    end

### be_available

Use `should` to check if the job_definition name is available.

    describe aws_batch_job_definitions do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `batch:client:describe_job_definitions` action with **Effect** set to `Allow`.
