---
title: About the aws_cloud_front_key_group Resource
platform: aws
---

# aws_cloud_front_key_group

Use the `aws_cloud_front_key_group` InSpec audit resource to test properties of a single specific AWS CloudFront Key Group.

## Syntax

Ensure that the key group exists.

    describe aws_cloud_front_key_group(id: "ID") do
      it { should exist }
    end

## Parameters

`id` _(required)_

| Property | Description |
| --- | --- |
| id | The identifier for the key group. |

For additional information, see the [AWS documentation on AWS CloudFront Key Group.](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-cloudfront-keygroup.html).

## Properties

| Property | Description | Field | 
| --- | --- | --- |
| id | The identifier for the key group. | id |
| last_modified_time | The date and time when the key group was last modified. | last_modified_time |
| key_group_config.name | A name to identify the key group. | name |
| key_group_config.items | A list of the identifiers of the public keys in the key group. | items |
| key_group_config.comment | A comment to describe the key group. The comment cannot be longer than 128 characters. | comment |

## Examples

### Ensure an id is available.
    describe aws_cloud_front_key_group(id: "ID") do
      its('id') { should eq 'ID' }
    end

### Ensure that the key group name is available.
    describe aws_cloud_front_key_group(id: "ID") do
        its('key_group_config.name') { should eq 'KeyGroupName' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `get` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_cloud_front_key_group(id: "ID") do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_cloud_front_key_group(id: "dummy") do
      it { should_not exist }
    end

### be_available

Use `should` to check if the entity is available.

    describe aws_cloud_front_key_group(id: "ID") do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `CloudFront:Client:GetKeyGroupResult` action with `Effect` set to `Allow`.