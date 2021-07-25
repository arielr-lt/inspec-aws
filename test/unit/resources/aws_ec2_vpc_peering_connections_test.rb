require 'helper'
require 'aws_ec2_vpc_peering_connections'
require 'aws-sdk-core'

class AWSEc2VPCPeeringConnectionsConstructorTest < Minitest::Test

  def test_empty_params_ok
    AWSEc2VPCPeeringConnections.new(client_args: { stub_responses: true })
  end

  def test_rejects_other_args
    assert_raises(ArgumentError) { AWSEc2VPCPeeringConnections.new('rubbish') }
  end

  def test_functions_non_existing_for_empty_response
    refute AWSEc2VPCPeeringConnections.new(client_args: { stub_responses: true }).exist?
  end
end

class AWSEc2VPCPeeringConnectionsHappyPathTest < Minitest::Test

  def setup
    data = {}
    data[:method] = :describe_vpc_peering_connections
    mock_data = {}
    mock_data[:accepter_vpc_info] = {}
    mock_data[:requester_vpc_info] = {}
    mock_data[:status] = {}
    mock_data[:tags] = []
    mock_data[:vpc_peering_connection_id] = "test1"
    data[:data] = { :vpc_peering_connections => [mock_data] }
    data[:client] = Aws::EC2::Client
    @vpc_peering_connections = AWSEc2VPCPeeringConnections.new(client_args: { stub_responses: true }, stub_data: [data])
  end

  def test_functions_exists
    assert @vpc_peering_connections.exist?
  end

  def test_vpc_peering_connection_ids
    assert_equal(@vpc_peering_connections.vpc_peering_connection_ids, ["test1"])
  end
end