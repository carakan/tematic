require File.dirname(__FILE__) + '/../../spec_helper'

describe "/descriptor_genericos/edit.html.erb" do
  include DescriptorGenericosHelper
  
  before do
    @descriptor_generico = mock_model(DescriptorGenerico)
    @descriptor_generico.stub!(:descriptorGenerico).and_return("MyString")
    assigns[:descriptor_generico] = @descriptor_generico
  end

  it "should render edit form" do
    render "/descriptor_genericos/edit.html.erb"
    
    response.should have_tag("form[action=#{descriptor_generico_path(@descriptor_generico)}][method=post]") do
      with_tag('input#descriptor_generico_descriptorGenerico[name=?]', "descriptor_generico[descriptorGenerico]")
    end
  end
end


