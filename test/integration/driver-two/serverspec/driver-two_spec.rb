require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file("/tmp/driver-two") do
  it { should exist }
  its(:content) { should contain "GD4100-GD4400" }
end
