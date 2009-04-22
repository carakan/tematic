require File.dirname(__FILE__) + '/../../spec_helper'

describe "/departamentos/index.html.erb" do
  include DepartamentosHelper
  
  before(:each) do
    departamento_98 = mock_model(Departamento)
    departamento_98.should_receive(:nombre).and_return("MyString")
    departamento_98.should_receive(:fundacion).and_return("MyString")
    departamento_98.should_receive(:aniversario).and_return("MyString")
    departamento_98.should_receive(:altitud).and_return("MyString")
    departamento_98.should_receive(:poblacion).and_return("1")
    departamento_98.should_receive(:superficie).and_return("MyString")
    departamento_98.should_receive(:capital).and_return("MyString")
    departamento_98.should_receive(:poblacion).and_return("MyString")
    departamento_99 = mock_model(Departamento)
    departamento_99.should_receive(:nombre).and_return("MyString")
    departamento_99.should_receive(:fundacion).and_return("MyString")
    departamento_99.should_receive(:aniversario).and_return("MyString")
    departamento_99.should_receive(:altitud).and_return("MyString")
    departamento_99.should_receive(:poblacion).and_return("1")
    departamento_99.should_receive(:superficie).and_return("MyString")
    departamento_99.should_receive(:capital).and_return("MyString")
    departamento_99.should_receive(:poblacion).and_return("MyString")

    assigns[:departamentos] = [departamento_98, departamento_99]
  end

  it "should render list of departamentos" do
    render "/departamentos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

