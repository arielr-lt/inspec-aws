# frozen_string_literal: true

require 'aws_backend'

class AWSBatchComputeEnvironment < AwsResourceBase
  name 'aws_batch_compute_environment'
  desc 'Describes one or more of your compute environments.'

  example "
    describe aws_batch_compute_environment(compute_environment_name: 'test1') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    opts = { compute_environment_name: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: [:compute_environment_name])

    raise ArgumentError, "#{@__resource_name__}: compute_environment_name must be provided" unless opts[:compute_environment_name] && !opts[:compute_environment_name].empty?
    @display_name = opts[:compute_environment_name]
    catch_aws_errors do
      resp = @aws.batch_client.describe_compute_environments({ compute_environments: [opts[:compute_environment_name]] })
      @compute_environments = resp.compute_environments[0].to_h
      create_resource_methods(@compute_environments)
    end
  end

  def id
    return nil unless exists?
    @compute_environments[:compute_environment_name]
  end

  def exists?
    !@compute_environments.nil? && !@compute_environments.empty?
  end

  def encrypted?
    @compute_environments[:encrypted]
  end

  def to_s
    "Compute Environment Name: #{@display_name}"
  end
end
