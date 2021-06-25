aws_user_pool_id = attribute("aws_user_pool_id", value: "", description: "")
aws_client_id = attribute("aws_client_id", value: "", description: "")
aws_client_name = attribute("aws_client_name", value: "", description: "")

aws_client_secret = attribute("aws_client_secret", value: "", description: "")

aws_allowed_o_auth_flows_user_pool_client = attribute("aws_allowed_o_auth_flows_user_pool_client", value: false, description: "")

control 'aws-auto-user-pool-client1-1.0' do
  impact 1.0
  title 'Ensure AWS User Pool Client has the correct properties.'

  describe aws_cognito_userpool_client(user_pool_id: aws_user_pool_id, client_id: aws_client_id) do
    it { should exist }
  end
end

control 'aws-auto-user-pool-client2-1.0' do
  impact 1.0
  title 'Ensure AWS User Pool Client has the correct properties.'

  describe aws_cognito_userpool_client(user_pool_id: aws_user_pool_id, client_id: aws_client_id) do
    its('user_pool_id') { should eq aws_user_pool_id }
    its('client_name') { should eq aws_client_name }
    its('client_id') { should eq aws_client_id }
    its('client_secret') { should eq aws_client_secret }
  end
end

control 'aws-auto-user-pool-client3-1.0' do
  impact 1.0
  title 'Ensure AWS User Pool Client has the correct properties.'

  describe aws_cognito_userpool_client(user_pool_id: aws_user_pool_id, client_id: aws_client_id) do
    its('supported_identity_providers') { should be_empty }
    its('callback_urls') { should be_empty }
    its('logout_urls') { should be_empty }
    its('default_redirect_uri') { should be_empty }
    its('allowed_o_auth_flows') { should be_empty }
    its('allowed_o_auth_scopes') { should be_empty }
    its('allowed_o_auth_flows_user_pool_client') { should eq aws_allowed_o_auth_flows_user_pool_client }
    its('analytics_configuration') { should be_empty }
  end
end