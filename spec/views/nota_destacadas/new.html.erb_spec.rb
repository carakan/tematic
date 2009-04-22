require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nota_destacadas/new.html.erb" do
  include NotaDestacadasHelper
  
  before(:each) do
    @nota_destacada = mock_model(NotaDestacada)
    @nota_destacada.stub!(:new_record?).and_return(true)
    @nota_destacada.stub!(:titulo).and_return("MyString")
    @nota_destacada.stub!(:resumen).and_return("MyText")
    @nota_destacada.stub!(:fuente).and_return("MyString")
    @nota_destacada.stub!(:archivo).and_return("MyString")
    @nota_destacada.stub!(:enlace).and_return("MyString")
    @nota_destacada.stub!(:imagen).and_return("MyString")
    assigns[:nota_destacada] = @nota_destacada
  end

  it "should render new form" do
    render "/nota_destacadas/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", nota_destacadas_path) do
      with_tag("input#nota_destacada_titulo[name=?]", "nota_destacada[titulo]")
      with_tag("textarea#nota_destacada_resumen[name=?]", "nota_destacada[resumen]")
      with_tag("input#nota_destacada_fuente[name=?]", "nota_destacada[fuente]")
      with_tag("input#nota_destacada_archivo[name=?]", "nota_destacada[archivo]")
      with_tag("input#nota_destacada_enlace[name=?]", "nota_destacada[enlace]")
      with_tag("input#nota_destacada_imagen[name=?]", "nota_destacada[imagen]")
    end
  end
end


