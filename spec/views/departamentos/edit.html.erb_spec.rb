require File.dirname(__FILE__) + '/../../spec_helper'

describe "/departamentos/edit.html.erb" do
  include DepartamentosHelper
  
  before do
    @departamento = mock_model(Departamento)
    @departamento.stub!(:nombre).and_return("MyString")
    @departamento.stub!(:fundacion).and_return("MyString")
    @departamento.stub!(:aniversario).and_return("MyString")
    @departamento.stub!(:altitud).and_return("MyString")
    @departamento.stub!(:poblacion).and_return("1")
    @departamento.stub!(:superficie).and_return("MyString")
    @departamento.stub!(:capital).and_return("MyString")
    @departamento.stub!(:poblacion).and_return("MyString")
    assigns[:departamento] = @departamento
  end

  it "should render edit form" do
    render "/departamentos/edit.html.erb"
    
    response.should have_tag("form[action=#{departamento_path(@departamento)}][method=post]") do
      with_tag('input#departamento_nombre[name=?]', "departamento[nombre]")
      with_tag('input#departamento_fundacion[name=?]', "departamento[fundacion]")
      with_tag('input#departamento_aniversario[name=?]', "departamento[aniversario]")
      with_tag('input#departamento_altitud[name=?]', "departamento[altitud]")
      with_tag('input#departamento_poblacion[name=?]', "departamento[poblacion]")
      with_tag('input#departamento_superficie[name=?]', "departamento[superficie]")
      with_tag('input#departamento_capital[name=?]', "departamento[capital]")
      with_tag('input#departamento_poblacion[name=?]', "departamento[poblacion]")
    end
  end
end


