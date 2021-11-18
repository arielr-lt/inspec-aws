aws_cloudfront_cache_policy_id = attribute(:aws_cloudfront_cache_policy_id, value: '', description: '')

control 'aws-cloudfront-cache-policies' do

  impact 1.0
  title 'Ensure Cloud Front Cache Policy resource has the correct properties.'

  describe aws_cloudfront_cache_policies do
    it { should exist }
  end

  describe aws_cloudfront_cache_policies do
    its('types') { should include 'managed' }
    its('ids') { should include aws_cloudfront_cache_policy_id }
    its('last_modified_times') { should_not be_empty }
    its('comments') { should include 'test comment' }
    its('names') { should include 'example-policy' }
    its('default_ttls') { should include 50 }
    its('max_ttls') { should include 100 }
    its('min_ttls') { should include 1 }
  end
end