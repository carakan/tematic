require File.dirname(__FILE__) + '/../../spec_helper'

describe "/especialistas/edit.html.erb" do
  include EspecialistasHelper
  
  before do
    @especialista = mock_model(Especialista)
    @especialista.stub!(:nombre).and_return("MyString")
    @especialista.stub!(:telefono).and_return("MyString")
    @especialista.stub!(:celular).and_return("MyString")
    @especialista.stub!(:perfil).and_return("MyText")
    @especialista.stub!(:publicacion).and_return("MyText")
    @especialista.stub!(:profesion).and_return("MyText")
    @especialista.stub!(:especialidad).and_return("MyText")
    @especialista.stub!(:lugar).and_return("MyString")
    @especialista.stub!(:email).and_return("MyString")
    @especialista.stub!(:paginaWeb).and_return("MyString")
    assigns[:especialista] = @especialista
  end

  it "should render edit form" do
    render "/especialistas/edit.html.erb"
    
    response.should have_tag("form[action=#{especialista_path(@especialista)}][method=post]") do
      with_tag('input#especialista_nombre[name=?]', "especialista[nombre]")
      with_tag('input#especialista_telefono[name=?]', "especialista[telefono]")
      with_tag('input#especialista_celular[name=?]', "especialista[celular]")
      with_tag('textarea#especialista_perfil[name=?]', "especialista[perfil]")
      with_tag('textarea#especialista_publicacion[name=?]', "especialista[publicacion]")
      with_tag('textarea#especialista_profesion[name=?]', "especialista[profesion]")
      with_tag('textarea#especialista_especialidad[name=?]', "especialista[especialidad]")
      with_tag('input#especialista_lugar[name=?]', "especialista[lugar]")
      with_tag('input#especialista_email[name=?]', "especialista[email]")
      with_tag('input#especialista_paginaWeb[name=?]', "especialista[paginaWeb]")
    end
  end
end


