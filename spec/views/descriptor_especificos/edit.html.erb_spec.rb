require File.dirname(__FILE__) + '/../../spec_helper'

describe "/descriptor_especificos/edit.html.erb" do
  include DescriptorEspecificosHelper
  
  before do
    @descriptor_especifico = mock_model(DescriptorEspecifico)
    @descriptor_especifico.stub!(:descriptorEspecifico).and_return("MyString")
    assigns[:descriptor_especifico] = @descriptor_especifico
  end

  it "should render edit form" do
    render "/descriptor_especificos/edit.html.erb"
    
    response.should have_tag("form[action=#{descriptor_especifico_path(@descriptor_especifico)}][method=post]") do
      with_tag('input#descriptor_especifico_descriptorEspecifico[name=?]', "descriptor_especifico[descriptorEspecifico]")
    end
  end
end


