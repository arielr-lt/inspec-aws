aws_waf_sql_injection_match_set_id = attribute(aws_waf_sql_injection_match_set_id, value: '', description: '')
aws_waf_sql_injection_match_set_name = attribute(aws_waf_sql_injection_match_set_name, value: '', description: '')

title 'Ensure the sql injection match set have the correct properties.'

control 'aws-waf-sql-injection-match-set-1.0' do
  impact 1.0

  describe aws_waf_sql_injection_match_set(sql_injection_match_set_id: aws_waf_sql_injection_match_set_id) do
    it { should exist }
  end

  describe aws_waf_sql_injection_match_set(sql_injection_match_set_id: aws_waf_sql_injection_match_set_id) do
    its('sql_injection_match_set_id') { should eq aws_waf_sql_injection_match_set_id }
    its('name') { should eq aws_waf_sql_injection_match_set_name }

    its('sql_injection_match_tuples_field_to_match_types') { should include 'QUERY_STRING' }
    its('sql_injection_match_tuples_field_to_match_data') { should_not be_empty }
    its('sql_injection_match_tuples_text_transformations') { should include 'URL_DECODE' }
  end
end