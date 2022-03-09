# frozen_string_literal: true

require 'aws_backend'

class AWSCloudFrontStreamingDistribution < AwsResourceBase
  name 'aws_cloudfront_streaming_distribution'
  desc 'Get the information about a distribution.'
  example "
    describe aws_cloudfront_streaming_distribution(id: 'CLOUDFRONT_STEAMING_DISTRIBUTION_ID') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    opts = { id: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: %i(id))
    raise ArgumentError, "#{@__resource_name__}: id must be provided" unless opts[:id] && !opts[:id].empty?
    @display_name = opts[:id]
    catch_aws_errors do
      resp = @aws.cloudfront_client.get_streaming_distribution({ id: opts[:id] })
      @res = resp.streaming_distribution.to_h
      create_resource_methods(@res)
    end
  end

  def id
    return nil unless exists?
    @res[:id]
  end

  def exists?
    !@res.nil? && !@res.empty?
  end

  def to_s
    "Cloudfront Streaming DistributionID: #{@display_name}"
  end

  def active_aws_account_numbers
    (active_trusted_signers.map(&:items)).map(&:aws_account_number)
  end

  def active_key_pair_id_quantities
    ((active_trusted_signers.map(&:items)).map(&:key_pair_ids)).map(&:quantity)
  end

  def active_key_pair_id_items
    ((active_trusted_signers.map(&:items)).map(&:key_pair_ids)).map(&:items)
  end
end
