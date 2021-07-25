---
title: About the aws_ec2_volume_attachments Resource
platform: aws
---

# aws\_ec2\_volume\_attachments

Use the `aws_ec2_volume_attachments` InSpec audit resource to test properties of a plural AWS EC2 VolumeAttachment.

The AWS::EC2::VolumeAttachment resource attaches an Amazon EBS volume to a running instance and exposes it to the instance with the specified device name.

## Syntax

Ensure that a volume id exists.

    describe aws_ec2_volume_attachments(volume_id: 'vol-1234567890') do
      it { should exist }
    end

## Parameters

`volume_id or name` _(required)_

## Properties of the Required Parameter

| Property | Description|
| --- | --- |
| volume_id | The volume ID. |
| name | The volume name. |

For additional information, see the [AWS documentation on AWS EC2 TransitGatewayRouteTablePropagation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-transitgatewayroutetablepropagation.html).

## Properties

| Property | Description | Fields |
| --- | --- | --- |
| attachments (attach_time) | The time stamp when the attachment initiated. | attach_times |
| attachments (device) | The device name specified in the block device mapping (for example, /dev/sda1 ). | devices |
| attachments (instance_id) | The ID of the instance the volume is attached to. | instance_ids |
| attachments (state) | The attachment state. | states |
| attachments (volume_id) | The volume ID. | volume_ids |
| attachments (delete_on_termination) | Whether the volume is deleted on instance termination. | delete_on_terminations |

## Examples

### Ensure a volume id is available.
    describe aws_ec2_volume_attachments(volume_id: 'vol-1234567890') do
      its('volume_ids') { should include 'vol-1234567890' }
    end

### Ensure that the device is `/dev/sda1`.
    describe aws_ec2_volume_attachments(volume_id: 'vol-1234567890') do
        its('devices') { should include '/dev/sda1' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_ec2_volume_attachments(volume_id: 'vol-1234567890') do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_ec2_volume_attachments(volume_id: 'dummy') do
      it { should_not exist }
    end

### be_available

Use `should` to check if the entity is available.

    describe aws_ec2_volume_attachments(volume_id: 'vol-1234567890') do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:client:describe_volumes` action with `Effect` set to `Allow`.