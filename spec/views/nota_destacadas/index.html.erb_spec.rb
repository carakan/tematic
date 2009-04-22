require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nota_destacadas/index.html.erb" do
  include NotaDestacadasHelper
  
  before(:each) do
    nota_destacada_98 = mock_model(NotaDestacada)
    nota_destacada_98.should_receive(:titulo).and_return("MyString")
    nota_destacada_98.should_receive(:resumen).and_return("MyText")
    nota_destacada_98.should_receive(:fuente).and_return("MyString")
    nota_destacada_98.should_receive(:archivo).and_return("MyString")
    nota_destacada_98.should_receive(:enlace).and_return("MyString")
    nota_destacada_98.should_receive(:imagen).and_return("MyString")
    nota_destacada_99 = mock_model(NotaDestacada)
    nota_destacada_99.should_receive(:titulo).and_return("MyString")
    nota_destacada_99.should_receive(:resumen).and_return("MyText")
    nota_destacada_99.should_receive(:fuente).and_return("MyString")
    nota_destacada_99.should_receive(:archivo).and_return("MyString")
    nota_destacada_99.should_receive(:enlace).and_return("MyString")
    nota_destacada_99.should_receive(:imagen).and_return("MyString")

    assigns[:nota_destacadas] = [nota_destacada_98, nota_destacada_99]
  end

  it "should render list of nota_destacadas" do
    render "/nota_destacadas/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

