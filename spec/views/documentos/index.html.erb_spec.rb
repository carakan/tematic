require File.dirname(__FILE__) + '/../../spec_helper'

describe "/documentos/index.html.erb" do
  include DocumentosHelper
  
  before(:each) do
    documento_98 = mock_model(Documento)
    documento_98.should_receive(:tituloMonografia).and_return("MyString")
    documento_98.should_receive(:autorMonografia).and_return("MyString")
    documento_98.should_receive(:tituloAnalitico).and_return("MyString")
    documento_98.should_receive(:autorAnalitico).and_return("MyString")
    documento_98.should_receive(:valorTitular).and_return("MyString")
    documento_98.should_receive(:valorAutor).and_return("MyString")
    documento_98.should_receive(:resumen).and_return("MyText")
    documento_98.should_receive(:archivo).and_return("MyString")
    documento_99 = mock_model(Documento)
    documento_99.should_receive(:tituloMonografia).and_return("MyString")
    documento_99.should_receive(:autorMonografia).and_return("MyString")
    documento_99.should_receive(:tituloAnalitico).and_return("MyString")
    documento_99.should_receive(:autorAnalitico).and_return("MyString")
    documento_99.should_receive(:valorTitular).and_return("MyString")
    documento_99.should_receive(:valorAutor).and_return("MyString")
    documento_99.should_receive(:resumen).and_return("MyText")
    documento_99.should_receive(:archivo).and_return("MyString")

    assigns[:documentos] = [documento_98, documento_99]
  end

  it "should render list of documentos" do
    render "/documentos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

