require File.dirname(__FILE__) + '/../../spec_helper'

describe "/descriptor_especificos/show.html.erb" do
  include DescriptorEspecificosHelper
  
  before(:each) do
    @descriptor_especifico = mock_model(DescriptorEspecifico)
    @descriptor_especifico.stub!(:descriptorEspecifico).and_return("MyString")

    assigns[:descriptor_especifico] = @descriptor_especifico
  end

  it "should render attributes in <p>" do
    render "/descriptor_especificos/show.html.erb"
    response.should have_text(/MyString/)
  end
end

