require File.dirname(__FILE__) + '/../../spec_helper'

describe "/imagens/index.html.erb" do
  include ImagensHelper
  
  before(:each) do
    imagen_98 = mock_model(Imagen)
    imagen_98.should_receive(:titulo).and_return("MyString")
    imagen_98.should_receive(:imagen).and_return("MyString")
    imagen_99 = mock_model(Imagen)
    imagen_99.should_receive(:titulo).and_return("MyString")
    imagen_99.should_receive(:imagen).and_return("MyString")

    assigns[:imagens] = [imagen_98, imagen_99]
  end

  it "should render list of imagens" do
    render "/imagens/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

