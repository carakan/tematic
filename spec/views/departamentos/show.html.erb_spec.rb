require File.dirname(__FILE__) + '/../../spec_helper'

describe "/departamentos/show.html.erb" do
  include DepartamentosHelper
  
  before(:each) do
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

  it "should render attributes in <p>" do
    render "/departamentos/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/1/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

