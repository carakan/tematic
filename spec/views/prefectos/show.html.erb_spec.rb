require File.dirname(__FILE__) + '/../../spec_helper'

describe "/prefectos/show.html.erb" do
  include PrefectosHelper
  
  before(:each) do
    @prefecto = mock_model(Prefecto)
    @prefecto.stub!(:nombre).and_return("MyString")
    @prefecto.stub!(:telefono).and_return("MyString")
    @prefecto.stub!(:celular).and_return("MyString")
    @prefecto.stub!(:fax).and_return("MyString")
    @prefecto.stub!(:direccion).and_return("MyString")
    @prefecto.stub!(:email).and_return("MyString")
    @prefecto.stub!(:paginaWeb).and_return("MyString")

    assigns[:prefecto] = @prefecto
  end

  it "should render attributes in <p>" do
    render "/prefectos/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

