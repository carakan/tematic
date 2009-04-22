require File.dirname(__FILE__) + '/../../spec_helper'

describe "/ministerios/show.html.erb" do
  include MinisteriosHelper
  
  before(:each) do
    @ministerio = mock_model(Ministerio)
    @ministerio.stub!(:ministerio).and_return("MyString")
    @ministerio.stub!(:responsable).and_return("MyString")
    @ministerio.stub!(:direccion).and_return("MyString")
    @ministerio.stub!(:telefono).and_return("MyString")
    @ministerio.stub!(:celular).and_return("MyString")
    @ministerio.stub!(:fax).and_return("MyString")
    @ministerio.stub!(:casilla).and_return("MyString")
    @ministerio.stub!(:email).and_return("MyString")
    @ministerio.stub!(:paginaWeb).and_return("MyString")

    assigns[:ministerio] = @ministerio
  end

  it "should render attributes in <p>" do
    render "/ministerios/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

