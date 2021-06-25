title 'Test single AWS VPN Gateway'
aws_vpn_gateway_id = attribute(:aws_vpn_gateway_id, default: '', description: 'The AWS VPN Gateway ID.')
aws_vpc_id = attribute(:aws_vpc_id, default: '', description: 'The AWS VPC ID.')
aws_amazon_side_asn = attribute(:aws_amazon_side_asn, default: '', description: 'The AWS amazon_side_asn')
aws_vpn_gw_name = attribute(:aws_vpn_gw_name, default: '', description: 'The AWS VPN Gateway Name')

control 'aws-vpn-gateway-1.0' do
  impact 1.0
  title 'Ensure AWS VPN Gateway has the correct properties.'

  describe aws_vpn_gateway(vpn_gateway_id: aws_vpn_gateway_id) do
    it { should exist }
    its('state') { should eq 'available' }
    its('type') { should eq 'ipsec.1' }
    its('vpn_gateway_id') { should eq aws_vpn_gateway_id }
    its('amazon_side_asn') { should eq aws_amazon_side_asn }
    its('tags') { should eq('Name' => aws_vpn_gw_name) }
    it { should be_attached }
    its('vpc_id') { should eq aws_vpc_id }
  end

  describe aws_vpn_gateway(aws_vpn_gateway_id) do
    it { should exist }
  end
end
