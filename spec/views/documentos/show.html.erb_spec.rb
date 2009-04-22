require File.dirname(__FILE__) + '/../../spec_helper'

describe "/documentos/show.html.erb" do
  include DocumentosHelper
  
  before(:each) do
    @documento = mock_model(Documento)
    @documento.stub!(:tituloMonografia).and_return("MyString")
    @documento.stub!(:autorMonografia).and_return("MyString")
    @documento.stub!(:tituloAnalitico).and_return("MyString")
    @documento.stub!(:autorAnalitico).and_return("MyString")
    @documento.stub!(:valorTitular).and_return("MyString")
    @documento.stub!(:valorAutor).and_return("MyString")
    @documento.stub!(:resumen).and_return("MyText")
    @documento.stub!(:archivo).and_return("MyString")

    assigns[:documento] = @documento
  end

  it "should render attributes in <p>" do
    render "/documentos/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
  end
end

