require File.dirname(__FILE__) + '/../../spec_helper'

describe "/descriptor_genericos/new.html.erb" do
  include DescriptorGenericosHelper
  
  before(:each) do
    @descriptor_generico = mock_model(DescriptorGenerico)
    @descriptor_generico.stub!(:new_record?).and_return(true)
    @descriptor_generico.stub!(:descriptorGenerico).and_return("MyString")
    assigns[:descriptor_generico] = @descriptor_generico
  end

  it "should render new form" do
    render "/descriptor_genericos/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", descriptor_genericos_path) do
      with_tag("input#descriptor_generico_descriptorGenerico[name=?]", "descriptor_generico[descriptorGenerico]")
    end
  end
end


