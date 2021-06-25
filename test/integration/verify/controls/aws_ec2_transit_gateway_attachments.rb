aws_transit_gateway_attachment_id = attribute(:aws_transit_gateway_attachment_id1, default: '', description: 'The IDs of the attachments.')
aws_transit_gateway_id = attribute(:aws_transit_gateway_id, default: '', description: 'The ID of the transit gateway.')
aws_transit_gateway_owner_id = attribute(:aws_transit_gateway_owner_id, default: '', description: 'The ID of the AWS account that owns the transit gateway.')

control 'aws-transit-gateway-attachments-v1.0.0' do
  impact 1.0
  title 'Describes one or more attachments between resources and transit gateways. By default, all attachments are described. Alternatively, you can filter the results by attachment ID, attachment state, resource ID, or resource owner.'
  describe aws_ec2_transit_gateway_attachments do
    it { should exist }
    its('count')             { should be <= 100 }
    its('count')             { should be >= 1 }
    its('transit_gateway_attachment_ids') { should include aws_transit_gateway_attachment_id }
    its('transit_gateway_ids') { should include aws_transit_gateway_id }
    its('transit_gateway_owner_ids') { should include aws_transit_gateway_owner_id }
    its('resource_owner_ids') { should_not be_empty }
    its('resource_types') { should_not be_empty }
    its('resource_ids') { should_not be_empty }
    its('states') { should_not be_empty }
  end
end