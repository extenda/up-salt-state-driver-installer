require_relative 'spec_helper'

describe file('/tmp/Epson_JavaPOS_ADK_1141_for_Linux') do
  it { should be_directory }
end

describe file('/opt/extenda/pos/nodes/commonclientconfig/config/layers/Printer/Printer.xml') do
  it { should exist }
  its(:content) { should contain 'epson-t88v' }
end
