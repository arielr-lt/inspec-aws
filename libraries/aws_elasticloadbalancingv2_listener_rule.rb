# frozen_string_literal: true

require 'aws_backend'

class AWSElasticLoadBalancingV2ListenerRule < AwsResourceBase
  name 'aws_elasticloadbalancingv2_listener_rule'
  desc 'Describes the specified rules or the rules for the specified listener. You must specify either a listener or one or more rules.'
  example "
    describe aws_elasticloadbalancingv2_listener_rule(rule_arns: 'ELB2_RULE_ARN') do
      it { should exist }
    end
  "
  def initialize(opts = {})
    opts = { rule_arns: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: [:rule_arns])
    raise ArgumentError, "#{@__resource_name__}: rule_arns must be provided" unless opts[:rule_arns] && !opts[:rule_arns].empty?
    @display_name = opts[:rule_arns]
    catch_aws_errors do
      resp = @aws.elb_client_v2.describe_rules({ rule_arns: [opts[:rule_arns]] })
      @listeners = resp.rules[0].to_h
      create_resource_methods(@listeners)
    end
  end

  def listener_arns
    return nil unless exists?
    @listeners[:listener_arns]
  end

  def exists?
    !@listeners.nil? && !@listeners.empty?
  end

  def to_s
    "ELB2 Rule ARN: #{@display_name}"
  end
end
