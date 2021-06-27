---
title: About the aws_route53resolver_resolver_rule_association Resource
platform: aws
---

# aws\_route53resolver\_resolver\_rule\_association

Use the `aws_route53resolver_resolver_rule_association` InSpec audit resource to test properties of a single specific AWS Route53Resolver Resolver Rule Association.

The AWS::Route53Resolver::ResolverRuleAssociation resource provides information about an association between a resolver rule and a VPC. The association determines which DNS queries that originate in the VPC are forwarded to your network.

## Syntax

Ensure that a resolver rule exists.

    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: 'ResourceId') do
      it { should exist }
    end

## Parameters

`resolver_rule_association_id` _(required)_

For additional information, see the [AWS documentation on AWS Route53Resolver Resolver Rule Association](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-athena-workgroup.html).

## Properties

| Property | Description|
| --- | --- |
| id | The ID of the association between a Resolver rule and a VPC. |
| resolver_rule_id | The ID of the Resolver rule that you associated with the VPC that is specified by VPCId. |
| name | The name of an association between a Resolver rule and a VPC. |
| vpc_id | The ID of the VPC that you associated the Resolver rule with. |
| status | A code that specifies the current status of the association between a Resolver rule and a VPC. |
| status_message | A detailed description of the status of the association between a Resolver rule and a VPC. |

## Examples

### Ensure a resolver rule name is available.
    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: 'ResourceId') do
      its('name') { should eq 'ResolverRuleName' }
    end

### Ensure that the status is `COMPLETE` or `FAILED`.
    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: 'ResourceId') do
        its('status') { should eq 'COMPLETE' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `get` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: 'ResourceId') do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.
      
    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: 'dummy') do
      it { should_not exist }
    end

### be_available

Use `should` to check if the entity is available.

    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: 'ResourceId') do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `route53resolver:client:get_resolver_rule_association` action with `Effect` set to `Allow`.