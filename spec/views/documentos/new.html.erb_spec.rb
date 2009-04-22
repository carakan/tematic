require File.dirname(__FILE__) + '/../../spec_helper'

describe "/documentos/new.html.erb" do
  include DocumentosHelper
  
  before(:each) do
    @documento = mock_model(Documento)
    @documento.stub!(:new_record?).and_return(true)
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

  it "should render new form" do
    render "/documentos/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", documentos_path) do
      with_tag("input#documento_tituloMonografia[name=?]", "documento[tituloMonografia]")
      with_tag("input#documento_autorMonografia[name=?]", "documento[autorMonografia]")
      with_tag("input#documento_tituloAnalitico[name=?]", "documento[tituloAnalitico]")
      with_tag("input#documento_autorAnalitico[name=?]", "documento[autorAnalitico]")
      with_tag("input#documento_valorTitular[name=?]", "documento[valorTitular]")
      with_tag("input#documento_valorAutor[name=?]", "documento[valorAutor]")
      with_tag("textarea#documento_resumen[name=?]", "documento[resumen]")
      with_tag("input#documento_archivo[name=?]", "documento[archivo]")
    end
  end
end


