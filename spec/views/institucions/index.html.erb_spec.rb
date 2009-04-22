require File.dirname(__FILE__) + '/../../spec_helper'

describe "/institucions/index.html.erb" do
  include InstitucionsHelper
  
  before(:each) do
    institucion_98 = mock_model(Institucion)
    institucion_98.should_receive(:institucion).and_return("MyString")
    institucion_98.should_receive(:sigla).and_return("MyString")
    institucion_98.should_receive(:direccion).and_return("MyString")
    institucion_98.should_receive(:telefono).and_return("MyString")
    institucion_98.should_receive(:fax).and_return("MyString")
    institucion_98.should_receive(:casilla).and_return("MyString")
    institucion_98.should_receive(:email).and_return("MyString")
    institucion_98.should_receive(:paginaWeb).and_return("MyString")
    institucion_99 = mock_model(Institucion)
    institucion_99.should_receive(:institucion).and_return("MyString")
    institucion_99.should_receive(:sigla).and_return("MyString")
    institucion_99.should_receive(:direccion).and_return("MyString")
    institucion_99.should_receive(:telefono).and_return("MyString")
    institucion_99.should_receive(:fax).and_return("MyString")
    institucion_99.should_receive(:casilla).and_return("MyString")
    institucion_99.should_receive(:email).and_return("MyString")
    institucion_99.should_receive(:paginaWeb).and_return("MyString")

    assigns[:institucions] = [institucion_98, institucion_99]
  end

  it "should render list of institucions" do
    render "/institucions/index.html.erb"
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

