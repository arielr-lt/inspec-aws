---
title: About the aws_cloud_watch_logs_log_stream Resource
platform: aws
---

# aws_cloud_watch_logs_log_stream

Use the `aws_cloud_watch_logs_log_stream` InSpec audit resource to test properties of a single specific AWS Logs LogStream.

The AWS::Logs::LogStream resource specifies an Amazon CloudWatch Logs log stream in a specific log group. A log stream represents the sequence of events coming from an application instance or resource that you are monitoring.

## Syntax

Ensure that the log stream exists.

    describe aws_cloud_watch_logs_log_stream(log_group_name: "LogGroupName", log_stream_name_prefix: 'LogStreamName') do
      it { should exist }
    end

## Parameters

`log_group_name` and `log_stream_name_prefix` _(required)_

| Property | Description |
| --- | --- |
| log_group_name | The name of the log group. |
| log_stream_name_prefix | The name of the log stream. |

For additional information, see the [AWS documentation on AWS Logs LogStream.](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-logs-logstream.html).

## Properties

| Property | Description | Field | 
| --- | --- | --- |
| log_stream_name | The name of the log stream. | log_stream_name |
| creation_time | The creation time of the stream, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC. | creation_time |
| first_event_timestamp | The time of the first event, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC. | first_event_timestamp |
| last_event_timestamp | The time of the most recent log event in the log stream in CloudWatch Logs. | last_event_timestamp |
| last_ingestion_time | The ingestion time, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC. | last_ingestion_time |
| upload_sequence_token | The sequence token. | upload_sequence_token |
| arn | The Amazon Resource Name (ARN) of the log stream. | arn |
| stored_bytes | The number of bytes stored. | stored_bytes |

## Examples

### Ensure a log stream name is available.
    describe aws_cloud_watch_logs_log_stream(log_group_name: "LogGroupName", log_stream_name_prefix: 'LogStreamName') do
      its('log_stream_name') { should eq 'LogStreamName' }
    end

### Ensure a log stream arn is available.
    describe aws_cloud_watch_logs_log_stream(log_group_name: "LogGroupName", log_stream_name_prefix: 'LogStreamName') do
        its('arn') { should eq 'ARN' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_cloud_watch_logs_log_stream(log_group_name: "LogGroupName", log_stream_name_prefix: 'LogStreamName') do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_cloud_watch_logs_log_stream(log_group_name: "dummy", log_stream_name_prefix: 'dummy') do
      it { should_not exist }
    end

### be_available

Use `should` to check if the entity is available.

    describe aws_cloud_watch_logs_log_stream(log_group_name: "LogGroupName", log_stream_name_prefix: 'LogStreamName') do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `CloudWatchLogs:Client:DescribeLogStreamsResponse` action with `Effect` set to `Allow`.