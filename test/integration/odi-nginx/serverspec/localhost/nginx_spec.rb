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

# Configuration
describe file("/etc/nginx/nginx.conf") do
  it {should be_file}
  its(:content) {should match /user www-data;/}
  its(:content) {should match /client_max_body_size 5M;/}
end
