# frozen_string_literal: true

require 'aws_backend'

class AWSLambdaPermission < AwsResourceBase
  name 'aws_lambda_permission'
  desc 'eturns the resource-based IAM policy for a function, version, or alias.'

  example "
    describe aws_lambda_permission(function_name: 'LambdaFunctionName', Sid: 'StatementID') do
      its('sid') { should eq 'StatementID' }
    end
  "

  def initialize(opts = {})
    super(opts)
    validate_parameters(required: %i(function_name Sid))
    raise ArgumentError, "#{@__resource_name__}: function_name must be provided" unless opts[:function_name] && !opts[:function_name].empty?
    raise ArgumentError, "#{@__resource_name__}: statement_id must be provided" unless opts[:Sid] && !opts[:Sid].empty?
    @statement_id = opts[:Sid]
    row = {}
    catch_aws_errors do
      resp = @aws.lambda_client.get_policy({ function_name: opts[:function_name] })
      # require 'byebug'
      # byebug
      statements = JSON.parse(resp.policy)['Statement']
      statements.each do |value|
        next if value['Sid'] != opts[:Sid]
        row = {
          sid: value['Sid'],
          effect: value['Effect'],
          principal: value['Principal'],
          action: value['Action'],
          resource: value['Resource'],
        }
      end
      create_resource_methods(row.to_h)
    end
  end

  def to_s
    "Statement ID: #{@statement_id}"
  end
end
