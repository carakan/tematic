require File.dirname(__FILE__) + '/../../spec_helper'

describe "/institucion_periodisticas/show.html.erb" do
  include InstitucionPeriodisticasHelper
  
  before(:each) do
    @institucion_periodistica = mock_model(InstitucionPeriodistica)
    @institucion_periodistica.stub!(:institucion).and_return("MyString")
    @institucion_periodistica.stub!(:sigla).and_return("MyString")
    @institucion_periodistica.stub!(:direccion).and_return("MyString")
    @institucion_periodistica.stub!(:telefono).and_return("MyString")
    @institucion_periodistica.stub!(:fax).and_return("MyString")
    @institucion_periodistica.stub!(:casilla).and_return("MyString")
    @institucion_periodistica.stub!(:email).and_return("MyString")
    @institucion_periodistica.stub!(:paginaWeb).and_return("MyString")

    assigns[:institucion_periodistica] = @institucion_periodistica
  end

  it "should render attributes in <p>" do
    render "/institucion_periodisticas/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

