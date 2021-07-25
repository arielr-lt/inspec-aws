aws_transit_gateway_attachment_id = attribute(:aws_transit_gateway_attachment_id1, value: '', description: 'The IDs of the attachments.')

control 'aws-ec2-transit-gateway-route-table-propagation-1.0' do
  impact 1.0
  title 'Describes information about the route table propagations for the specified transit gateway route table.'

  describe aws_ec2_transit_gateway_route_table_propagation(transit_gateway_route_table_id: aws_transit_gateway_attachment_id) do
    it { should exist }
  end

  describe aws_ec2_transit_gateway_route_table_propagation(transit_gateway_route_table_id: aws_transit_gateway_attachment_id) do
    its ('transit_gateway_attachment_id') { should eq aws_transit_gateway_attachment_id }
    its ('resource_id') { should_not be_empty }
    its ('resource_type') { should eq 'vpc'}
    its ('state') { should eq 'enabled'}
  end

  describe aws_ec2_transit_gateway_route_table_propagation(transit_gateway_route_table_id: 'tgw-rtb-1234567890') do
    it { should_not exist }
  end
end