# frozen_string_literal: true

require 'aws_backend'

class AWSApiGatewayAPIKey < AwsResourceBase
  name 'aws_apigateway_api_key'
  desc 'Gets information about the current ApiKey resource.'

  example "
    describe aws_apigateway_api_key(api_key: 'APIID') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    opts = { api_key: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: %i(api_key))
    raise ArgumentError, "#{@__resource_name__}: api_key must be provided" unless opts[:api_key] && !opts[:api_key].empty?
    @display_name = opts[:api_key]
    catch_aws_errors do
      resp = @aws.apigateway_client.get_api_key({ api_key: opts[:api_key] })
      @res = resp.to_h
      create_resource_methods(@res)
    end
  end

  def api_key
    return nil unless exists?
    @res[:api_key]
  end

  def exists?
    !@res.nil? && !@res.empty?
  end

  def to_s
    "API Key: #{@display_name}"
  end
end
