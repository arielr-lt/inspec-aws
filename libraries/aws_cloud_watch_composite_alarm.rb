# frozen_string_literal: true

require 'aws_backend'

class AWSCloudWatchCompositeAlarm < AwsResourceBase
  name 'aws_cloud_watch_composite_alarm'
  desc 'Gets a composite alarm.'

  example "
    describe aws_cloud_watch_composite_alarm(alarm_name: 'CompositeAlarmName') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    opts = { alarm_name: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: %i(alarm_name))
    raise ArgumentError, "#{@__resource_name__}: alarm_name must be provided" unless opts[:alarm_name] && !opts[:alarm_name].empty?
    @display_name = opts[:alarm_name]
    catch_aws_errors do
      resp = @aws.cloudwatch_client.describe_alarms({ alarm_names: [opts[:alarm_name]], alarm_types: ["CompositeAlarm"] })
      @res = resp.composite_alarms[0].to_h
      create_resource_methods(@res)
    end
  end

  def alarm_name
    return nil unless exists?
    @res[:alarm_name]
  end

  def exists?
    !@res.nil? && !@res.empty?
  end

  def to_s
    "Composite Alarm Name: #{@display_name}"
  end
end
