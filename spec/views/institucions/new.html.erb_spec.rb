require File.dirname(__FILE__) + '/../../spec_helper'

describe "/institucions/new.html.erb" do
  include InstitucionsHelper
  
  before(:each) do
    @institucion = mock_model(Institucion)
    @institucion.stub!(:new_record?).and_return(true)
    @institucion.stub!(:institucion).and_return("MyString")
    @institucion.stub!(:sigla).and_return("MyString")
    @institucion.stub!(:direccion).and_return("MyString")
    @institucion.stub!(:telefono).and_return("MyString")
    @institucion.stub!(:fax).and_return("MyString")
    @institucion.stub!(:casilla).and_return("MyString")
    @institucion.stub!(:email).and_return("MyString")
    @institucion.stub!(:paginaWeb).and_return("MyString")
    assigns[:institucion] = @institucion
  end

  it "should render new form" do
    render "/institucions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", institucions_path) do
      with_tag("input#institucion_institucion[name=?]", "institucion[institucion]")
      with_tag("input#institucion_sigla[name=?]", "institucion[sigla]")
      with_tag("input#institucion_direccion[name=?]", "institucion[direccion]")
      with_tag("input#institucion_telefono[name=?]", "institucion[telefono]")
      with_tag("input#institucion_fax[name=?]", "institucion[fax]")
      with_tag("input#institucion_casilla[name=?]", "institucion[casilla]")
      with_tag("input#institucion_email[name=?]", "institucion[email]")
      with_tag("input#institucion_paginaWeb[name=?]", "institucion[paginaWeb]")
    end
  end
end


