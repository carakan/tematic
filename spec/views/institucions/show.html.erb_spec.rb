require File.dirname(__FILE__) + '/../../spec_helper'

describe "/institucions/show.html.erb" do
  include InstitucionsHelper
  
  before(:each) do
    @institucion = mock_model(Institucion)
    @institucion.stub!(:institucion).and_return("MyString")
    @institucion.stub!(:sigla).and_return("MyString")
    @institucion.stub!(:direccion).and_return("MyString")
    @institucion.stub!(:telefono).and_return("MyString")
    @institucion.stub!(:fax).and_return("MyString")
    @institucion.stub!(:casilla).and_return("MyString")
    @institucion.stub!(:email).and_return("MyString")
    @institucion.stub!(:paginaWeb).and_return("MyString")

    assigns[:institucion] = @institucion
  end

  it "should render attributes in <p>" do
    render "/institucions/show.html.erb"
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

