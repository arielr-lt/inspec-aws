aws_cloudfront_distribution_id = attribute('aws_cloudfront_distribution_id', value: '', description: '')
aws_cloudfront_distribution_arn = attribute('aws_cloudfront_distribution_arn', value: '', description: '')
aws_cloudfront_distribution_status = attribute('aws_cloudfront_distribution_status', value: '', description: '')

control 'aws-cloud-front-streaming-distributions-1.0' do
  impact 1.0
  title 'List CloudFront distributions.'

  describe aws_cloud_front_streaming_distributions do
    it { should exist }
  end

  describe aws_cloud_front_streaming_distributions do
    its('ids') { should include aws_cloudfront_distribution_id }
    its('arns') { should include aws_cloudfront_distribution_arn }
    its('statuses') { should include aws_cloudfront_distribution_status }
  end
end