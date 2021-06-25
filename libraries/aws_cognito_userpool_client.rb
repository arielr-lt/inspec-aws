# frozen_string_literal: true

require 'aws_backend'

class AWSCognitoUserPoolClient < AwsResourceBase
  name 'aws_cognito_userpool_client'
  desc 'Client method for returning the configuration information and metadata of the specified user pool app client.'

  example "
    describe aws_cognito_userpool_client(user_pool_id: 'test1', client_id: 'test1') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    opts = { user_pool_id: opts, client_id: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: %i(user_pool_id client_id))
    catch_aws_errors do
      resp = @aws.cognitoidentityprovider_client.describe_user_pool_client({ user_pool_id: opts[:user_pool_id], client_id: opts[:client_id] })
      @user_pool_client = resp.user_pool_client.to_h
      create_resource_methods(@user_pool_client)
    end
  end

  def id
    return nil unless exists?
    @user_pool_client[:user_pool_id, :client_id]
  end

  def exists?
    !@user_pool_client.nil? && !@user_pool_client.empty?
  end

  def encrypted?
    @user_pool_client[:encrypted]
  end

  def to_s
    "userpool_client: #{@display_name}"
  end
end
