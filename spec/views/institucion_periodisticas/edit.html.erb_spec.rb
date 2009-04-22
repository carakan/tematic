require File.dirname(__FILE__) + '/../../spec_helper'

describe "/institucion_periodisticas/edit.html.erb" do
  include InstitucionPeriodisticasHelper
  
  before do
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

  it "should render edit form" do
    render "/institucion_periodisticas/edit.html.erb"
    
    response.should have_tag("form[action=#{institucion_periodistica_path(@institucion_periodistica)}][method=post]") do
      with_tag('input#institucion_periodistica_institucion[name=?]', "institucion_periodistica[institucion]")
      with_tag('input#institucion_periodistica_sigla[name=?]', "institucion_periodistica[sigla]")
      with_tag('input#institucion_periodistica_direccion[name=?]', "institucion_periodistica[direccion]")
      with_tag('input#institucion_periodistica_telefono[name=?]', "institucion_periodistica[telefono]")
      with_tag('input#institucion_periodistica_fax[name=?]', "institucion_periodistica[fax]")
      with_tag('input#institucion_periodistica_casilla[name=?]', "institucion_periodistica[casilla]")
      with_tag('input#institucion_periodistica_email[name=?]', "institucion_periodistica[email]")
      with_tag('input#institucion_periodistica_paginaWeb[name=?]', "institucion_periodistica[paginaWeb]")
    end
  end
end


