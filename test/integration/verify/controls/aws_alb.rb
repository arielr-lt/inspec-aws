title 'Test single AWS ALB.'

aws_alb_arn = attribute(:aws_alb_arn, value: '', description: 'The AWS ALB arn.')
region = attribute(:aws_region, value: '', description: 'The AWS region.')

control 'aws-alb-1.0' do

  impact 1.0
  title 'Ensure AWS ALB has the correct properties.'

  describe aws_alb(load_balancer_arn: aws_alb_arn) do
    it                         { should exist }
    its ('load_balancer_arn')  { should eq aws_alb_arn }
    its ('zone_names')         { should include "#{region}a" }
  end
  
  describe aws_alb(load_balancer_arn: aws_alb_arn) do
    it                         { should exist }
    its ('access_log_enabled') { should eq true }
  end 
  
  describe aws_alb(aws_alb_arn) do
    it                         { should exist }
    its ('load_balancer_arn')  { should eq aws_alb_arn }
    its ('zone_names')         { should include "#{region}a" }
  end
end