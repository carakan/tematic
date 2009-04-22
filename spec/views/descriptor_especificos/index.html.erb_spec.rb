require File.dirname(__FILE__) + '/../../spec_helper'

describe "/descriptor_especificos/index.html.erb" do
  include DescriptorEspecificosHelper
  
  before(:each) do
    descriptor_especifico_98 = mock_model(DescriptorEspecifico)
    descriptor_especifico_98.should_receive(:descriptorEspecifico).and_return("MyString")
    descriptor_especifico_99 = mock_model(DescriptorEspecifico)
    descriptor_especifico_99.should_receive(:descriptorEspecifico).and_return("MyString")

    assigns[:descriptor_especificos] = [descriptor_especifico_98, descriptor_especifico_99]
  end

  it "should render list of descriptor_especificos" do
    render "/descriptor_especificos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

