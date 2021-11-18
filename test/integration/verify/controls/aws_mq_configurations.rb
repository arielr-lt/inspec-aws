# frozen_string_literal: true
configuration_id = value(:configuration_id, value: '', description: ' configuration_id of AWS MQ')
configuration_arn = value(:configuration_arn, value: '', description: 'configuration_arn of AWS MQ')

title 'Test a AWS MQ Broker.'
control 'aws_mq_configuration-1.0' do
  impact 1.0
  title 'Ensure AWS MQ configuration has the correct properties.'

  describe aws_mq_configuration(configuration_id: configuration_id) do
    it { should exist }
    its('arn') { should include configuration_arn }
    its('description') { should include 'test_configuration'  }
    its('configuration_id') { should include configuration_id }
    its('engine_type') { should include "ActiveMQ"  }
  end
end

