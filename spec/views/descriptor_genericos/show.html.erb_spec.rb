require File.dirname(__FILE__) + '/../../spec_helper'

describe "/descriptor_genericos/show.html.erb" do
  include DescriptorGenericosHelper
  
  before(:each) do
    @descriptor_generico = mock_model(DescriptorGenerico)
    @descriptor_generico.stub!(:descriptorGenerico).and_return("MyString")

    assigns[:descriptor_generico] = @descriptor_generico
  end

  it "should render attributes in <p>" do
    render "/descriptor_genericos/show.html.erb"
    response.should have_text(/MyString/)
  end
end

