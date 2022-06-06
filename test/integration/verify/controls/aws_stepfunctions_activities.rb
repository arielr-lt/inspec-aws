aws_sfn_activity_id = attribute("aws_sfn_activity_id", value: "", description: "")
aws_sfn_activity_name = attribute("aws_sfn_activity_name", value: "", description: "")

control 'aws-stepfunctions-activities-1.0' do
  impact 1.0
  title 'Test the properties of the stepfunctions activities.'

  describe aws_stepfunctions_activities do
    it { should exist }
  end

  describe aws_stepfunctions_activities do
    its('activity_arns') { should include aws_sfn_activity_id }
    its('names') { should include aws_sfn_activity_name }
  end
end