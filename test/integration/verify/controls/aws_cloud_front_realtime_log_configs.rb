aws_cloudfront_realtime_log_config_name = attribute('aws_cloudfront_realtime_log_config_name', value: '', description: '')
aws_cloudfront_realtime_log_config_arn = attribute('aws_cloudfront_realtime_log_config_arn', value: '', description: '')
aws_cloudfront_realtime_log_config_sampling_rate = attribute('aws_cloudfront_realtime_log_config_sampling_rate', value: '', description: '')

control 'aws-cloud-front-realtime-log-configs-1.0' do
  impact 1.0
  title 'Gets a list of real-time log configurations.'

  describe aws_cloud_front_realtime_log_configs do
    it { should exist }
  end

  describe aws_cloud_front_realtime_log_configs do
    its('arns') { should include aws_cloudfront_realtime_log_config_arn }
    its('names') { should include aws_cloudfront_realtime_log_config_name }
    its('sampling_rates') { should include aws_cloudfront_realtime_log_config_sampling_rate }
    its('end_points') { should_not be_empty }
    its('fields') { should_not be_empty }
  end
end