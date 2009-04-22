require File.dirname(__FILE__) + '/../../spec_helper'

describe "/glosarios/index.html.erb" do
  include GlosariosHelper
  
  before(:each) do
    glosario_98 = mock_model(Glosario)
    glosario_98.should_receive(:concepto).and_return("MyString")
    glosario_98.should_receive(:definicion).and_return("MyText")
    glosario_99 = mock_model(Glosario)
    glosario_99.should_receive(:concepto).and_return("MyString")
    glosario_99.should_receive(:definicion).and_return("MyText")

    assigns[:glosarios] = [glosario_98, glosario_99]
  end

  it "should render list of glosarios" do
    render "/glosarios/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

