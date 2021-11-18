app_id= attribute(app_id, default: "", description: "")
title 'Audits Amplify App.'
control 'aws_amplify_app-1.0' do
  impact 1.0
  title 'Ensure Amplify App have the correct properties.'
  describe aws_amplify_app(app_id: app_id) do
    it { should exist }
    its('count') { should >= 1 }
    its('app_ids') { should eq app_id }
    its('app_arns') { should eq 'arn:aws:amplify:us-east-1:112758395563:apps/d2pdgpts4t82r' }
  end
end
