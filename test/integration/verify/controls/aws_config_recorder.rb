title 'Test single AWS Config Recorder'

aws_config_recorder_role_arn = attribute(:aws_config_recorder_role_arn, default: '', description: 'The AWS Config Recorder ARN.')
aws_configuration_recorder_name = attribute(:aws_configuration_recorder_name, default: '', description: 'The AWS Config Recorder name.')

control 'aws-config-recorder-1.0' do

  impact 1.0
  title 'Ensure AWS Config Recorder has the correct properties.'

  describe aws_config_recorder do
    it { should exist }
    its('recorder_name') { should eq aws_configuration_recorder_name }
    its('role_arn') { should eq aws_config_recorder_role_arn }
    its('resource_types') { should eq [] }
    it { should_not be_recording }
    it { should be_recording_all_resource_types }
    it { should_not be_recording_all_global_types }
  end

  describe aws_config_recorder(recorder_name: aws_configuration_recorder_name) do
    it { should exist }
    its('recorder_name') { should eq aws_configuration_recorder_name }
    its('role_arn') { should eq aws_config_recorder_role_arn }
    its('resource_types') { should eq [] }
    it { should_not be_recording }
    it { should be_recording_all_resource_types }
    it { should_not be_recording_all_global_types }
  end

  describe aws_config_recorder(recorder_name: 'notthere') do
    it { should_not exist }
  end

end