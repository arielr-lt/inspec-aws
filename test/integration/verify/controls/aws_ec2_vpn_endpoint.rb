# frozen_string_literal: true
client_vpn_endpoint_id = attribute('client_vpn_endpoint_id', value: '', description: '')

skip_control 'aws_ec2_client_vpn_endpoint-1.0' do
  impact 1.0
  title 'Test the properties of the vpn endpoint.'

  describe aws_ec2_client_vpn_endpoint(client_vpn_endpoint_id: client_vpn_endpoint_id) do
    it { should exist }
    its('client_vpn_endpoint_id') { should eq client_vpn_endpoint_id }
    its('description') { should eq "Example Client VPN endpoint" }
    its('dns_name') { should_not eq '*.cvpn-endpoint-1234567890.prod.clientvpn.us-east-2.amazonaws.com' }
    its('split_tunnel') { should eq false }
    its('vpn_protocol') { should eq 'openvpn' }
    its('transport_protocol') { should eq 'udp' }
    its('vpn_port') { should_not eq 44375 }
    its('server_certificate_arn') { should_not eq 'arn:aws:acm:us-east-2:1234567890:certificate/a20fe841-b1ef-4785-aefb-e69838eacdcb' }
  end
end