require File.dirname(__FILE__) + '/../../spec_helper'

describe "/descriptor_especificos/new.html.erb" do
  include DescriptorEspecificosHelper
  
  before(:each) do
    @descriptor_especifico = mock_model(DescriptorEspecifico)
    @descriptor_especifico.stub!(:new_record?).and_return(true)
    @descriptor_especifico.stub!(:descriptorEspecifico).and_return("MyString")
    assigns[:descriptor_especifico] = @descriptor_especifico
  end

  it "should render new form" do
    render "/descriptor_especificos/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", descriptor_especificos_path) do
      with_tag("input#descriptor_especifico_descriptorEspecifico[name=?]", "descriptor_especifico[descriptorEspecifico]")
    end
  end
end


