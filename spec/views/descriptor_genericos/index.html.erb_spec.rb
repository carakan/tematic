require File.dirname(__FILE__) + '/../../spec_helper'

describe "/descriptor_genericos/index.html.erb" do
  include DescriptorGenericosHelper
  
  before(:each) do
    descriptor_generico_98 = mock_model(DescriptorGenerico)
    descriptor_generico_98.should_receive(:descriptorGenerico).and_return("MyString")
    descriptor_generico_99 = mock_model(DescriptorGenerico)
    descriptor_generico_99.should_receive(:descriptorGenerico).and_return("MyString")

    assigns[:descriptor_genericos] = [descriptor_generico_98, descriptor_generico_99]
  end

  it "should render list of descriptor_genericos" do
    render "/descriptor_genericos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

