require File.dirname(__FILE__) + '/../../spec_helper'

describe "/especialistas/show.html.erb" do
  include EspecialistasHelper
  
  before(:each) do
    @especialista = mock_model(Especialista)
    @especialista.stub!(:nombre).and_return("MyString")
    @especialista.stub!(:telefono).and_return("MyString")
    @especialista.stub!(:celular).and_return("MyString")
    @especialista.stub!(:perfil).and_return("MyText")
    @especialista.stub!(:publicacion).and_return("MyText")
    @especialista.stub!(:profesion).and_return("MyText")
    @especialista.stub!(:especialidad).and_return("MyText")
    @especialista.stub!(:lugar).and_return("MyString")
    @especialista.stub!(:email).and_return("MyString")
    @especialista.stub!(:paginaWeb).and_return("MyString")

    assigns[:especialista] = @especialista
  end

  it "should render attributes in <p>" do
    render "/especialistas/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

