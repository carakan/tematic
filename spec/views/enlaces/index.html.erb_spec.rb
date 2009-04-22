require File.dirname(__FILE__) + '/../../spec_helper'

describe "/enlaces/index.html.erb" do
  include EnlacesHelper
  
  before(:each) do
    enlace_98 = mock_model(Enlace)
    enlace_98.should_receive(:titulo).and_return("MyString")
    enlace_98.should_receive(:enlace).and_return("MyString")
    enlace_98.should_receive(:imagen).and_return("MyString")
    enlace_98.should_receive(:descripcion).and_return("MyString")
    enlace_98.should_receive(:orden).and_return("1")
    enlace_98.should_receive(:mostrar).and_return(false)
    enlace_99 = mock_model(Enlace)
    enlace_99.should_receive(:titulo).and_return("MyString")
    enlace_99.should_receive(:enlace).and_return("MyString")
    enlace_99.should_receive(:imagen).and_return("MyString")
    enlace_99.should_receive(:descripcion).and_return("MyString")
    enlace_99.should_receive(:orden).and_return("1")
    enlace_99.should_receive(:mostrar).and_return(false)

    assigns[:enlaces] = [enlace_98, enlace_99]
  end

  it "should render list of enlaces" do
    render "/enlaces/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", false, 2)
  end
end

