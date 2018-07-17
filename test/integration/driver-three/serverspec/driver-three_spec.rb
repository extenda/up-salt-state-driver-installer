require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file("/tmp/driver-three") do
  it { should exist }
  its(:content) { should contain "BA63" }
end
