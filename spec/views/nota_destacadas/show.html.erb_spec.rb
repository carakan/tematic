require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nota_destacadas/show.html.erb" do
  include NotaDestacadasHelper
  
  before(:each) do
    @nota_destacada = mock_model(NotaDestacada)
    @nota_destacada.stub!(:titulo).and_return("MyString")
    @nota_destacada.stub!(:resumen).and_return("MyText")
    @nota_destacada.stub!(:fuente).and_return("MyString")
    @nota_destacada.stub!(:archivo).and_return("MyString")
    @nota_destacada.stub!(:enlace).and_return("MyString")
    @nota_destacada.stub!(:imagen).and_return("MyString")

    assigns[:nota_destacada] = @nota_destacada
  end

  it "should render attributes in <p>" do
    render "/nota_destacadas/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

