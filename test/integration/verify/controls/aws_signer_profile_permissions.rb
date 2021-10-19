aws_signer_signing_profile_permission_action = attribute("aws_signer_signing_profile_permission_action", value: "", description: "")
aws_signer_signing_profile_permission_profile_name = attribute("aws_signer_signing_profile_permission_profile_name", value: "", description: "")
aws_signer_signing_profile_permission_principal = attribute("aws_signer_signing_profile_permission_principal", value: "", description: "")
aws_signer_signing_profile_permission_statement_id = attribute("aws_signer_signing_profile_permission_statement_id", value: "", description: "")

control 'aws_signer_profile_permissions-1.0' do
  impact 1.0
  title 'Test the properties of the ses receipt rules.'

  describe aws_signer_profile_permissions(profile_name: aws_signer_signing_profile_permission_profile_name) do
    it { should exist }
  end

  describe aws_signer_profile_permissions(profile_name: aws_signer_signing_profile_permission_profile_name) do
    its('actions') { should include aws_signer_signing_profile_permission_action }
    its('principals') { should include aws_signer_signing_profile_permission_principal }
    its('statement_ids') { should include aws_signer_signing_profile_permission_statement_id }
    its('profile_versions') { should_not be_empty }
  end
end