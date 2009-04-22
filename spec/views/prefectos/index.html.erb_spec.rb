require File.dirname(__FILE__) + '/../../spec_helper'

describe "/prefectos/index.html.erb" do
  include PrefectosHelper
  
  before(:each) do
    prefecto_98 = mock_model(Prefecto)
    prefecto_98.should_receive(:nombre).and_return("MyString")
    prefecto_98.should_receive(:telefono).and_return("MyString")
    prefecto_98.should_receive(:celular).and_return("MyString")
    prefecto_98.should_receive(:fax).and_return("MyString")
    prefecto_98.should_receive(:direccion).and_return("MyString")
    prefecto_98.should_receive(:email).and_return("MyString")
    prefecto_98.should_receive(:paginaWeb).and_return("MyString")
    prefecto_99 = mock_model(Prefecto)
    prefecto_99.should_receive(:nombre).and_return("MyString")
    prefecto_99.should_receive(:telefono).and_return("MyString")
    prefecto_99.should_receive(:celular).and_return("MyString")
    prefecto_99.should_receive(:fax).and_return("MyString")
    prefecto_99.should_receive(:direccion).and_return("MyString")
    prefecto_99.should_receive(:email).and_return("MyString")
    prefecto_99.should_receive(:paginaWeb).and_return("MyString")

    assigns[:prefectos] = [prefecto_98, prefecto_99]
  end

  it "should render list of prefectos" do
    render "/prefectos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

