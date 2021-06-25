aws_user_pool_id = attribute("aws_user_pool_id", value: "", description: "")
aws_identity_pool_name = attribute("aws_identity_pool_name", value: "", description: "")


control 'aws-auto-user-pools1-1.0' do
    impact 1.0
    title 'Ensure AWS User Pool has the correct properties.'
  
    describe aws_cognito_userpools do
        it { should exist }
    end
end

control 'aws-auto-user-pools2-1.0' do
    impact 1.0
    title 'Ensure AWS User Pool has the correct properties.'
  
    describe aws_cognito_userpools do
        its('ids') { should include aws_user_pool_id }
        its('names') { should include aws_identity_pool_name }
        its('lambda_configs') { should_not be_empty }
        its('statuses') { should_not be_empty }
    end
end