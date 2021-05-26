title 'Test Collection of EC2 AWS VPN Gateway'

aws_vpn_gateway_id = attribute(:aws_vpn_gateway_id, default: '', description: 'The AWS VPN Gateway ID.')
aws_vpc_id = attribute(:aws_vpc_id, default: '', description: 'The AWS VPC ID.')
aws_amazon_side_asn = attribute(:aws_amazon_side_asn, default: '', description: 'The AWS amazon_side_asn')
aws_vpn_gw_name = attribute(:aws_vpn_gw_name, default: '', description: 'The AWS VPN Gateway Name')

control 'aws-vpn-gateways-1.0' do
  impact 1.0
  title 'Ensure AWS VPN Gateways has the correct properties.'
  describe aws_vpn_gateways do
    it { should exist }
    its('states') { should include 'available' }
    its('types') { should include 'ipsec.1' }
    its('vpn_gateway_ids') { should include aws_vpn_gateway_id }
    its('amazon_side_asns') { should include aws_amazon_side_asn }
    its('tags') { should include('Name' => aws_vpn_gw_name) }
    its('vpc_attachments') { should include(state: 'attached', vpc_id: aws_vpc_id) }
  end

  aws_vpn_gateways.each do |aws_vpn_gateway_id|
    describe aws_vpn_gateway(vpn_gateway_id: aws_vpn_gateway_id) do
      it { should exist }
      its('state') { should eq 'available' }
    end
  end
end
