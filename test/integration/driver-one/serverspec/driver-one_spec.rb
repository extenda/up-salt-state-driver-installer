require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file("/tmp/driver-one") do
  it { should exist }
  its(:content) { should contain "TM-T88V" }
end

describe file("/tmp/JavaPOS") do
  it { should exist }
end
