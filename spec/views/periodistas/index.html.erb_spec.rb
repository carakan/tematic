require File.dirname(__FILE__) + '/../../spec_helper'

describe "/periodistas/index.html.erb" do
  include PeriodistasHelper
  
  before(:each) do
    periodista_98 = mock_model(Periodista)
    periodista_98.should_receive(:nombre).and_return("MyString")
    periodista_98.should_receive(:telefono).and_return("MyString")
    periodista_98.should_receive(:celular).and_return("MyString")
    periodista_98.should_receive(:perfil).and_return("MyText")
    periodista_98.should_receive(:profesion).and_return("MyText")
    periodista_98.should_receive(:direccion).and_return("MyText")
    periodista_98.should_receive(:email).and_return("MyString")
    periodista_99 = mock_model(Periodista)
    periodista_99.should_receive(:nombre).and_return("MyString")
    periodista_99.should_receive(:telefono).and_return("MyString")
    periodista_99.should_receive(:celular).and_return("MyString")
    periodista_99.should_receive(:perfil).and_return("MyText")
    periodista_99.should_receive(:profesion).and_return("MyText")
    periodista_99.should_receive(:direccion).and_return("MyText")
    periodista_99.should_receive(:email).and_return("MyString")

    assigns[:periodistas] = [periodista_98, periodista_99]
  end

  it "should render list of periodistas" do
    render "/periodistas/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

