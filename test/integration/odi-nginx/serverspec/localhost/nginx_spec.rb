require 'spec_helper'

# Make sure nginx is running
describe service("nginx") do
  it { should be_running }
end

# Make sure default vhosts are removed
describe file("/etc/nginx/sites-enabled/default") do
  it { should_not be_file }
end
describe file("/etc/nginx/sites-enabled/000-default") do
  it { should_not be_file }
end
