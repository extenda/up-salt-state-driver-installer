require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file("/tmp/driver-two") do
  it { should exist }
  its(:content) { should contain "def456" }
end
