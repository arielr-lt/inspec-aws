aws_waf_byte_match_set_id = attribute(aws_waf_byte_match_set_id, value: '', description: '')
aws_waf_byte_match_set_name = attribute(aws_waf_byte_match_set_name, value: '', description: '')

title 'Ensure the byte match sets have the correct properties.'

control 'aws-waf-byte-match-sets-1.0' do
  impact 1.0

  describe aws_waf_byte_match_sets do
    it { should exist }
  end

  describe aws_waf_byte_match_sets do
    its('byte_match_set_ids') { should include aws_waf_byte_match_set_id }
    its('names') { should include aws_waf_byte_match_set_name }
  end
end

