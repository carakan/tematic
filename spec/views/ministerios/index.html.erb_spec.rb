require File.dirname(__FILE__) + '/../../spec_helper'

describe "/ministerios/index.html.erb" do
  include MinisteriosHelper
  
  before(:each) do
    ministerio_98 = mock_model(Ministerio)
    ministerio_98.should_receive(:ministerio).and_return("MyString")
    ministerio_98.should_receive(:responsable).and_return("MyString")
    ministerio_98.should_receive(:direccion).and_return("MyString")
    ministerio_98.should_receive(:telefono).and_return("MyString")
    ministerio_98.should_receive(:celular).and_return("MyString")
    ministerio_98.should_receive(:fax).and_return("MyString")
    ministerio_98.should_receive(:casilla).and_return("MyString")
    ministerio_98.should_receive(:email).and_return("MyString")
    ministerio_98.should_receive(:paginaWeb).and_return("MyString")
    ministerio_99 = mock_model(Ministerio)
    ministerio_99.should_receive(:ministerio).and_return("MyString")
    ministerio_99.should_receive(:responsable).and_return("MyString")
    ministerio_99.should_receive(:direccion).and_return("MyString")
    ministerio_99.should_receive(:telefono).and_return("MyString")
    ministerio_99.should_receive(:celular).and_return("MyString")
    ministerio_99.should_receive(:fax).and_return("MyString")
    ministerio_99.should_receive(:casilla).and_return("MyString")
    ministerio_99.should_receive(:email).and_return("MyString")
    ministerio_99.should_receive(:paginaWeb).and_return("MyString")

    assigns[:ministerios] = [ministerio_98, ministerio_99]
  end

  it "should render list of ministerios" do
    render "/ministerios/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

