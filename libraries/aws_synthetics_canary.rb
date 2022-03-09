# frozen_string_literal: true

require 'aws_backend'

class AWSSyntheticsCanary < AwsResourceBase
  name 'aws_synthetics_canary'
  desc 'Retrieves complete information about one canary.'
  example "
    describe aws_synthetics_canary(name: 'SYNTHETICS_CANARY_NAME') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    super(opts)
    validate_parameters(required: %i(name))
    raise ArgumentError, "#{@__resource_name__}: name must be provided" unless opts[:name] && !opts[:name].empty?
    @display_name = opts[:name]
    catch_aws_errors do
      resp = @aws.synthetics_client.get_canary({ name: opts[:name] })
      @res = resp.canary.to_h
      create_resource_methods(@res)
    end
  end

  def name
    return nil unless exists?
    @res[:name]
  end

  def exists?
    !@res.nil? && !@res.empty?
  end

  def to_s
    "Synthetics Canary Name: #{@display_name}"
  end
end
