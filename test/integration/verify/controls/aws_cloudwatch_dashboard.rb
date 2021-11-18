dashboard_arns = attribute(:dashboard_arn, value: '', description: '')
dashboard_names = attribute(:dashboard_name, value: '', description: '')

title 'Test single AWS CloudWatch Dashboard'

control 'aws-cloudwatch-dashboard-1.0' do

  impact 1.0
  title 'Ensure AWS cloudwatch dashboards has the correct properties.'

  describe aws_cloudwatch_dashboard(dashboard_name: dashboard_names) do
    it { should exist }
    its('dashboard_arn') { should eq dashboard_arns }
    its('dashboard_name') { should eq dashboard_names }
  end
end

