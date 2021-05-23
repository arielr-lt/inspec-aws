control 'aws-dms-replication-subnet-groups-1.0' do
    impact 1.0
    title 'Ensure AWS DMS Replication Subnet Groups has the correct properties.'
    describe aws_dms_replication_subnet_groups do
        it { should exist }
    end
end

control 'aws-dms-replication-subnet-groups-1.0' do
    impact 1.0
    title 'Ensure AWS DMS Replication Subnet Groups has the correct properties.'
    describe aws_dms_replication_subnet_groups do
        its('replication_subnet_group_identifiers') { should include "test1" }
        its('replication_subnet_group_descriptions') { should include "test1" }
        its('vpc_ids') { should include "vpc-0123456789" }
        its('subnet_group_statuses') { should include "Complete" }
        its('subnets') { should_not be_empty}
    end
end
