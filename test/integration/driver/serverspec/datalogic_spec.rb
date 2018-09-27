require_relative 'spec_helper'

describe file('/opt/dls') do
  it { should be_directory }
end

describe file('/opt/extenda/pos/nodes/commonclientconfig/config/layers/Scanner/Scanner.xml') do
  it { should exist }
  its(:content) { should contain 'datalogic-gm4100' }
end

describe file('/opt/extenda/pos/nodes/commonclientconfig/config/layers/Scanner2/Scanner2.xml') do
  it { should exist }
  its(:content) { should contain 'datalogic-mg3300' }
end
