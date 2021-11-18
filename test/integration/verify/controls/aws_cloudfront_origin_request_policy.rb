request_origin_id = attribute(:request_origin_id, value: '', description: '')

title 'Test Single origin request policy.'

control 'aws-cloudfront-origin-request-policy-1.0' do

  impact 1.0
  title 'Ensure AWS CloudFront origin request policy has the correct properties.'

  describe aws_cloudfront_origin_request_policy(id: request_origin_id) do
    it { should exist }
    its('origin_request_policy_config.name') { should eq 'test-policy' }
  end
end
