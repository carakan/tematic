require File.dirname(__FILE__) + '/../../spec_helper'

describe "/especialistas/index.html.erb" do
  include EspecialistasHelper
  
  before(:each) do
    especialista_98 = mock_model(Especialista)
    especialista_98.should_receive(:nombre).and_return("MyString")
    especialista_98.should_receive(:telefono).and_return("MyString")
    especialista_98.should_receive(:celular).and_return("MyString")
    especialista_98.should_receive(:perfil).and_return("MyText")
    especialista_98.should_receive(:publicacion).and_return("MyText")
    especialista_98.should_receive(:profesion).and_return("MyText")
    especialista_98.should_receive(:especialidad).and_return("MyText")
    especialista_98.should_receive(:lugar).and_return("MyString")
    especialista_98.should_receive(:email).and_return("MyString")
    especialista_98.should_receive(:paginaWeb).and_return("MyString")
    especialista_99 = mock_model(Especialista)
    especialista_99.should_receive(:nombre).and_return("MyString")
    especialista_99.should_receive(:telefono).and_return("MyString")
    especialista_99.should_receive(:celular).and_return("MyString")
    especialista_99.should_receive(:perfil).and_return("MyText")
    especialista_99.should_receive(:publicacion).and_return("MyText")
    especialista_99.should_receive(:profesion).and_return("MyText")
    especialista_99.should_receive(:especialidad).and_return("MyText")
    especialista_99.should_receive(:lugar).and_return("MyString")
    especialista_99.should_receive(:email).and_return("MyString")
    especialista_99.should_receive(:paginaWeb).and_return("MyString")

    assigns[:especialistas] = [especialista_98, especialista_99]
  end

  it "should render list of especialistas" do
    render "/especialistas/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

