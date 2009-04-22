require File.dirname(__FILE__) + '/../../spec_helper'

describe "/institucion_periodisticas/index.html.erb" do
  include InstitucionPeriodisticasHelper
  
  before(:each) do
    institucion_periodistica_98 = mock_model(InstitucionPeriodistica)
    institucion_periodistica_98.should_receive(:institucion).and_return("MyString")
    institucion_periodistica_98.should_receive(:sigla).and_return("MyString")
    institucion_periodistica_98.should_receive(:direccion).and_return("MyString")
    institucion_periodistica_98.should_receive(:telefono).and_return("MyString")
    institucion_periodistica_98.should_receive(:fax).and_return("MyString")
    institucion_periodistica_98.should_receive(:casilla).and_return("MyString")
    institucion_periodistica_98.should_receive(:email).and_return("MyString")
    institucion_periodistica_98.should_receive(:paginaWeb).and_return("MyString")
    institucion_periodistica_99 = mock_model(InstitucionPeriodistica)
    institucion_periodistica_99.should_receive(:institucion).and_return("MyString")
    institucion_periodistica_99.should_receive(:sigla).and_return("MyString")
    institucion_periodistica_99.should_receive(:direccion).and_return("MyString")
    institucion_periodistica_99.should_receive(:telefono).and_return("MyString")
    institucion_periodistica_99.should_receive(:fax).and_return("MyString")
    institucion_periodistica_99.should_receive(:casilla).and_return("MyString")
    institucion_periodistica_99.should_receive(:email).and_return("MyString")
    institucion_periodistica_99.should_receive(:paginaWeb).and_return("MyString")

    assigns[:institucion_periodisticas] = [institucion_periodistica_98, institucion_periodistica_99]
  end

  it "should render list of institucion_periodisticas" do
    render "/institucion_periodisticas/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

