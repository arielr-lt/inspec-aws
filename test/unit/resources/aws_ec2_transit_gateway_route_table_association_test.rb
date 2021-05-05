require 'helper'
require 'aws_ec2_transit_gateway_route_table_association'
require 'aws-sdk-core'

class AwsEc2TransitGatewayRouteTableAssociationConstructorTest < Minitest::Test
  def test_empty_params_not_ok
    assert_raises(ArgumentError) { AwsEc2TransitGatewayRouteTableAssociation.new(client_args: { stub_responses: true }) }
  end

  def test_accepts_transit_gateway_attachment_id_as_hash_eight_sign
    AwsEc2TransitGatewayRouteTableAssociation.new(transit_gateway_attachment_id: 'tgw-attach-006f2fd0a03d51323', client_args: { stub_responses: true })
  end

  def test_accepts_transit_gateway_attachment_id_as_hash
    AwsEc2TransitGatewayRouteTableAssociation.new(transit_gateway_attachment_id: 'tgw-attach-006f2fd0a03d51323', client_args: { stub_responses: true })
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsEc2TransitGatewayRouteTableAssociation.new(rubbish: 9) }
  end
end

class AwsEc2TransitGatewayRouteTableAssociationPathTest < Minitest::Test

  def setup
    data = {}
    data[:method] = :describe_transit_gateway_attachments
    mock_transit_gateway_attachments = {}
    mock_transit_gateway_attachments[:transit_gateway_attachment_id] = 'tgw-attach-006f2fd0a03d51323'
    mock_transit_gateway_attachments[:transit_gateway_route_table_id] = 'tgw-rtb-052d947d91b6bb69f'
    mock_transit_gateway_attachments[:state] = 'available'
    data[:data] = { :transit_gateway_attachments => [mock_transit_gateway_attachments] }
    data[:client] = Aws::EC2::Client
    @transit_gateway_attachment = AwsEc2TransitGatewayRouteTableAssociation.new(transit_gateway_attachment_id: 'tgw-attach-006f2fd0a03d51323',client_args: { stub_responses: true }, stub_data: [data])
  end

  def test_transit_gateway_attachment_id_exists
    assert @transit_gateway_attachment.exists?
  end

  def test_transit_gateway_attachment_id_available
    assert @transit_gateway_attachment.available?
  end

  def test_transit_gateway_route_table_id
    assert_equal(@transit_gateway_attachment.transit_gateway_attachment_id, 'tgw-attach-006f2fd0a03d51323')
  end

  def test_transit_gateway_route_table_id
    assert_equal(@transit_gateway_attachment.transit_gateway_route_table_id, 'tgw-rtb-052d947d91b6bb69f')
  end

  def test_state
    assert_equal(@addr.transit_gateway_attachment, 'available')
  end
end