# InSpec test for recipe starship::default

describe file '/opt/starship/starship' do
  it { should exist }
  it { should be_executable }
end

describe file '/root/.bashrc' do
  it { should exist }
  its('content') { should match /^eval \"\$\(\/opt\/starship\/starship init bash\)\"$/ }
end

describe directory '/root/.config/' do
  it { should exist }
end

describe file '/root/.config/starship.toml' do
  it { should exist }
  its('content') { should match /^\[character\]$/ }
  its('content') { should match /^error_symbol = \"✗\$\"$/ }
  its('content') { should match /^\[git_branch\]$/ }
  its('content') { should match /^symbol = \":\"$/ }
  its('content') { should match /^\[git_status\]$/ }
  its('content') { should match /^behind = \"⇣\"$/ }
  its('content') { should match /^deleted = \"✖\"$/ }
  its('content') { should match /^symbol = \"✦\"$/ }
  its('content') { should match /^symbol = \"ℜ:\"$/ }
  its('content') { should match /^symbol = \"Τ:\"$/ }
end

describe file '/home/mattray/.bashrc' do
  it { should_not exist }
end

describe directory '/home/mattray/.config/' do
  it { should_not exist }
end

describe file '/home/mattray/.config/starship.toml' do
  it { should_not exist }
end
