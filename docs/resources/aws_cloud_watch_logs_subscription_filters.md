---
title: About the aws_cloud_watch_logs_subscription_filters Resource
platform: aws
---

# aws_cloud_watch_logs_subscription_filters

Use the `aws_cloud_watch_logs_subscription_filters` InSpec audit resource to test properties of a single specific AWS Logs Subscription Filter.

The AWS::Logs::SubscriptionFilter resource specifies a subscription filter and associates it with the specified log group.

## Syntax

Ensure that the subscription filter exists.

    describe aws_cloud_watch_logs_subscription_filters(spot_fleet_request_id: "LogGroupName") do
      it { should exist }
    end

## Parameters

`log_group_name` _(required)_

| Property | Description |
| --- | --- |
| log_group_name | The name of the log group. |

For additional information, see the [AWS documentation on AWS Logs SubscriptionFilter.](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-logs-subscriptionfilter.html).

## Properties

| Property | Description | Field | 
| --- | --- | --- |
| filter_names | The name of the subscription filter. | filter_name |
| log_group_names | The name of the log group. | log_group_name |
| filter_patterns | A symbolic description of how CloudWatch Logs should interpret the data in each log event. | filter_pattern |
| destination_arns | The Amazon Resource Name (ARN) of the destination. | destination_arn |
| role_arns | The role arn. | role_arn |
| distributions | The method used to distribute log data to the destination, which can be either random or grouped by log stream. | distribution |
| creation_times | The creation time of the subscription filter, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC. | creation_time |

## Examples

### Ensure a filter name is available.
    describe aws_cloud_watch_logs_subscription_filters(spot_fleet_request_id: "LogGroupName") do
      its('filter_names') { should include 'FilterName' }
    end

### Ensure a filter log group name is available.
    describe aws_cloud_watch_logs_subscription_filters(spot_fleet_request_id: "LogGroupName") do
        its('log_group_names') { should include 'LogGroupName' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_cloud_watch_logs_subscription_filters(spot_fleet_request_id: "LogGroupName") do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_cloud_watch_logs_subscription_filters(spot_fleet_request_id: "dummy") do
      it { should_not exist }
    end

### be_available

Use `should` to check if the entity is available.

    describe aws_cloud_watch_logs_subscription_filters(spot_fleet_request_id: "LogGroupName") do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `CloudWatchLogs:Client:DescribeSubscriptionFiltersResponse` action with `Effect` set to `Allow`.