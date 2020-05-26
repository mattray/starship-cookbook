# InSpec test for recipe starship::default

describe file '/opt/starship/starship' do
  it { should exist }
  it { should be_executable }
end

describe file '/root/.bashrc' do
  it { should exist }
  its('content') { should match /^eval \"\$\(\/opt\/starship\/starship init bash\)\"$/ }
end

describe file '/home/mattray/.bashrc' do
  it { should_not exist }
end
