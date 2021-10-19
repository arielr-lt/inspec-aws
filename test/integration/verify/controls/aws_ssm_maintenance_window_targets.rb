aws_ssm_maintenance_window_id = attribute("aws_ssm_maintenance_window_id", value: "", description: "")
aws_ssm_maintenance_window_target_description = attribute("aws_ssm_maintenance_window_target_description", value: "", description: "")
aws_ssm_maintenance_window_target_id = attribute("aws_ssm_maintenance_window_target_id", value: "", description: "")
aws_ssm_maintenance_window_target_name = attribute("aws_ssm_maintenance_window_target_id", value: "", description: "")

control 'aws-ssm-maintenance-window-targets-1.0' do
  impact 1.0
  title 'Test the properties of the ssm maintenance window targets.'

  describe aws_ssm_maintenance_window_targets(window_id: aws_ssm_maintenance_window_id) do
    it { should exist }
  end

  describe aws_ssm_maintenance_window_targets(window_id: aws_ssm_maintenance_window_id) do
    its('window_ids') { should include aws_ssm_maintenance_window_id }
    its('window_target_ids') { should include aws_ssm_maintenance_window_target_id }
    its('resource_types') { should include 'INSTANCE' }

    its('targets') { should_not be_empty }

    its('owner_informations') { should_not be_empty }
    its('names') { should include aws_ssm_maintenance_window_target_name }
    its('descriptions') { should include aws_ssm_maintenance_window_target_description }
  end
end