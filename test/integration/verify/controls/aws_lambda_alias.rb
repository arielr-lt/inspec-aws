aws_lambda_alias_name = attribute(:aws_lambda_alias_name, value: '')
aws_lambda_alias_function_name = attribute(:aws_lambda_alias_function_name, value: '')
aws_lambda_alias_arn = attribute(:aws_lambda_alias_arn, value: '')
aws_lambda_alias_description = attribute(:aws_lambda_alias_description, value: '')

control 'aws-lambda-alias-1.0' do
  impact 1.0
  title 'Test the properties of the lambda alias.'

  describe aws_lambda_alias(function_name: aws_lambda_alias_function_name, function_alias_name: aws_lambda_alias_name) do
    it { should exist }
  end

  describe aws_lambda_alias(function_name: aws_lambda_alias_function_name, function_alias_name: aws_lambda_alias_name) do
    its('alias_arn') { should eq aws_lambda_alias_arn }
    its('name') { should eq aws_lambda_alias_name }
    its('function_version') { should eq '$LATEST' }
    its('description') { should eq aws_lambda_alias_description }
    its('routing_config.additional_version_weights') { should be_empty }
    its('revision_id') { should_not be_empty }
  end
end