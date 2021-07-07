---
title: About the aws_transit_gateway_multicast_domains Resource
platform: aws
---

# aws\_transit\_gateway\_multicast\_domains

Use the `aws_transit_gateway_multicast_domains` InSpec audit resource to test properties of a plural AWS EC2 TransitGatewayMulticastDomain.

The AWS::EC2::TransitGatewayMulticastDomain resource creates a Connect attachment from a specified transit gateway attachment.

## Syntax

Ensure that transit gateway multicast domain exists.

    describe aws_transit_gateway_multicast_domains(transit_gateway_multicast_domain_ids: "tgw-mcast-domain-1234567890") do
      it { should exist }
    end

## Parameters

`transit_gateway_attachment_ids` _(required)_

The transit_gateway_attachment_ids is the ID of the transit gateway multicast domain.

For additional information, see the [AWS documentation on AWS EC2 TransitGatewayMulticastDomain](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-transitgatewaymulticastdomain.html).

## Properties

| Property | Description|
| --- | --- |
| transit_gateway_multicast_domain_ids | The ID of the transit gateway multicast domain. |
| transit_gateway_ids | The ID of the transit gateway. |
| transit_gateway_multicast_domain_arns | The Amazon Resource Name (ARN) of the transit gateway multicast domain. |
| owner_ids | The ID of the AWS account that owns the transit gateway multiicast domain. |
| options | The options for the transit gateway multicast domain. |
| states | The state of the transit gateway multicast domain. |
| creation_times | The time the transit gateway multicast domain was created. |
| tags | The tags for the transit gateway multicast domain. |

## Examples

### Ensure a transit gateway attachment id is available.
    describe aws_transit_gateway_multicast_domains(transit_gateway_multicast_domain_ids: "tgw-mcast-domain-1234567890") do
    its('transit_gateway_multicast_domain_id') { should eq 'tgw-mcast-domain-1234567890' }
    end

### Ensure that the state is `available`.
    describe aws_transit_gateway_multicast_domains(transit_gateway_multicast_domain_ids: "tgw-mcast-domain-1234567890") do
        its('states') { should include 'available' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_transit_gateway_multicast_domains(transit_gateway_multicast_domain_ids: "tgw-mcast-domain-1234567890") do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_transit_gateway_multicast_domains(transit_gateway_multicast_domain_id: "dummy") do
      it { should_not exist }
    end

### be_available

Use `should` to check if the function is available.

    describe aws_transit_gateway_multicast_domains(transit_gateway_multicast_domain_ids: "tgw-mcast-domain-1234567890") do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:client:describe_transit_gateway_multicast_domains` action with `Effect` set to `Allow`.