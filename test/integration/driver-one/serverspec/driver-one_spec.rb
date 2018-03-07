require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file("/tmp/driver-one") do
  it { should exist }
  its(:content) { should contain "abc123" }
end
