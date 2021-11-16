require 'helper'
require 'aws_emr_clusters'
require 'aws-sdk-core'
require_relative 'mock/aws_emr_mock'

class AwsEmrClustersConstructorTest < Minitest::Test
  def test_empty_params_ok
    AwsEmrClusters.new(client_args: { stub_responses: true })
  end

  def test_rejects_other_args
    assert_raises(ArgumentError) { AwsEmrClusters.new('rubbish') }
  end

  def test_snapshots_non_existing_for_empty_response
    refute AwsEmrClusters.new(client_args: { stub_responses: true }).exist?
  end
end

class AwsEmrClustersHappyPathTest < Minitest::Test
  def setup
    @clusters = AwsEmrClusters.new(client_args: { stub_responses: true }, stub_data: AwsEmrMock.new.stub_data(StubDataType::PLURAL))
  end

  def test_clusters_exists
    assert @clusters.exist?
  end

  def test_clusters_running
    assert @clusters.running?
  end
end
