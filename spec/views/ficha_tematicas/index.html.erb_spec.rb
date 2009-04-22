require File.dirname(__FILE__) + '/../../spec_helper'

describe "/ficha_tematicas/index.html.erb" do
  include FichaTematicasHelper
  
  before(:each) do
    ficha_tematica_98 = mock_model(FichaTematica)
    ficha_tematica_98.should_receive(:autor).and_return("MyString")
    ficha_tematica_98.should_receive(:resumen).and_return("MyText")
    ficha_tematica_98.should_receive(:pagina).and_return("MyString")
    ficha_tematica_98.should_receive(:titulo).and_return("MyString")
    ficha_tematica_98.should_receive(:editorial).and_return("MyString")
    ficha_tematica_98.should_receive(:lugar).and_return("MyString")
    ficha_tematica_98.should_receive(:fechaYear).and_return("1")
    ficha_tematica_99 = mock_model(FichaTematica)
    ficha_tematica_99.should_receive(:autor).and_return("MyString")
    ficha_tematica_99.should_receive(:resumen).and_return("MyText")
    ficha_tematica_99.should_receive(:pagina).and_return("MyString")
    ficha_tematica_99.should_receive(:titulo).and_return("MyString")
    ficha_tematica_99.should_receive(:editorial).and_return("MyString")
    ficha_tematica_99.should_receive(:lugar).and_return("MyString")
    ficha_tematica_99.should_receive(:fechaYear).and_return("1")

    assigns[:ficha_tematicas] = [ficha_tematica_98, ficha_tematica_99]
  end

  it "should render list of ficha_tematicas" do
    render "/ficha_tematicas/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

