# frozen_string_literal: true

require 'aws_backend'

class AWSRAMResourceShare < AwsResourceBase
  name 'aws_ram_resource_share'
  desc 'Describes the resource shares of the ram.'

  example "
    describe aws_ram_resource_share(resource_owner: 'SELF', resource_share_arn: 'resource_share_arn_test') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    opts = { resource_owner: opts, resource_share_arn: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: %i(resource_owner resource_share_arn))
    raise ArgumentError, "#{@__resource_name__}: resource_owner must be provided" unless opts[:resource_owner] && !opts[:resource_owner].empty?
    raise ArgumentError, "#{@__resource_name__}: resource_share_arn must be provided" unless opts[:resource_share_arn] && !opts[:resource_share_arn].empty?
    @display_name = opts[:resource_share_arn]
    catch_aws_errors do
      resp = @aws.ram_client.get_resource_shares({ resource_owner: opts[:resource_owner], resource_share_arns: [opts[:resource_share_arn]] })
      @res = resp.resource_shares[0].to_h
      create_resource_methods(@res)
    end
  end

  def id
    return nil unless exists?
    @res[:resource_share_arn]
  end

  def exists?
    !@res.nil? && !@res.empty?
  end

  def encrypted?
    @res[:encrypted]
  end

  def to_s
    "resource_share: #{@display_name}"
  end
end
