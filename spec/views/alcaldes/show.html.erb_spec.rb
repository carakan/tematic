require File.dirname(__FILE__) + '/../../spec_helper'

describe "/alcaldes/show.html.erb" do
  include AlcaldesHelper
  
  before(:each) do
    @alcalde = mock_model(Alcalde)
    @alcalde.stub!(:nombre).and_return("MyString")
    @alcalde.stub!(:telefono).and_return("MyString")
    @alcalde.stub!(:celular).and_return("MyString")
    @alcalde.stub!(:email).and_return("MyString")
    @alcalde.stub!(:paginaWeb).and_return("MyString")

    assigns[:alcalde] = @alcalde
  end

  it "should render attributes in <p>" do
    render "/alcaldes/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

