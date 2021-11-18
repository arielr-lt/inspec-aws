# frozen_string_literal: true

app_id = attribute(app_id, value: '', description: '')
branch_name = attribute(branch_name, value: '', description: '')

title 'Ensure all Amplify App have the correct properties.'

control 'aws_amplify_branches-1.0' do
  impact 1.0
  title 'Ensure all Amplify App have the correct properties.'

  describe aws_amplify_branches(app_id: app_id) do
    it { should exist }
  end

  describe aws_amplify_branches(app_id: app_id) do
    its('count') { should >= 1 }
    its('branch_names') { should include branch_name }
    its('display_names') { should include 'test-name' }
  end
end

