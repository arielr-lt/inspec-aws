aws_cloudfront_distribution_id = attribute('aws_cloudfront_distribution_id', value: '', description: '')
aws_cloudfront_distribution_arn = attribute('aws_cloudfront_distribution_arn', value: '', description: '')
aws_cloudfront_distribution_status = attribute('aws_cloudfront_distribution_status', value: '', description: '')

control 'aws-cloud-front-streaming-distribution-1.0' do
  impact 1.0
  title 'Get the information about a distribution.'

  describe aws_cloud_front_streaming_distribution(id: aws_cloudfront_distribution_id) do
    it { should exist }
  end

  describe aws_cloud_front_streaming_distribution(id: aws_cloudfront_distribution_id) do
    its('id') { should eq aws_cloudfront_distribution_id }
    its('arn') { should eq aws_cloudfront_distribution_arn }
    its('status') { should eq aws_cloudfront_distribution_status }
  end
end