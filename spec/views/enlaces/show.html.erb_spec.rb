require File.dirname(__FILE__) + '/../../spec_helper'

describe "/enlaces/show.html.erb" do
  include EnlacesHelper
  
  before(:each) do
    @enlace = mock_model(Enlace)
    @enlace.stub!(:titulo).and_return("MyString")
    @enlace.stub!(:enlace).and_return("MyString")
    @enlace.stub!(:imagen).and_return("MyString")
    @enlace.stub!(:descripcion).and_return("MyString")
    @enlace.stub!(:orden).and_return("1")
    @enlace.stub!(:mostrar).and_return(false)

    assigns[:enlace] = @enlace
  end

  it "should render attributes in <p>" do
    render "/enlaces/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/1/)
    response.should have_text(/als/)
  end
end

