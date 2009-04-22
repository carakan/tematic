require File.dirname(__FILE__) + '/../../spec_helper'

describe "/periodistas/edit.html.erb" do
  include PeriodistasHelper
  
  before do
    @periodista = mock_model(Periodista)
    @periodista.stub!(:nombre).and_return("MyString")
    @periodista.stub!(:telefono).and_return("MyString")
    @periodista.stub!(:celular).and_return("MyString")
    @periodista.stub!(:perfil).and_return("MyText")
    @periodista.stub!(:profesion).and_return("MyText")
    @periodista.stub!(:direccion).and_return("MyText")
    @periodista.stub!(:email).and_return("MyString")
    assigns[:periodista] = @periodista
  end

  it "should render edit form" do
    render "/periodistas/edit.html.erb"
    
    response.should have_tag("form[action=#{periodista_path(@periodista)}][method=post]") do
      with_tag('input#periodista_nombre[name=?]', "periodista[nombre]")
      with_tag('input#periodista_telefono[name=?]', "periodista[telefono]")
      with_tag('input#periodista_celular[name=?]', "periodista[celular]")
      with_tag('textarea#periodista_perfil[name=?]', "periodista[perfil]")
      with_tag('textarea#periodista_profesion[name=?]', "periodista[profesion]")
      with_tag('textarea#periodista_direccion[name=?]', "periodista[direccion]")
      with_tag('input#periodista_email[name=?]', "periodista[email]")
    end
  end
end


