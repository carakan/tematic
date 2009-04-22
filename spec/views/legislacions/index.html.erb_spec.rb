require File.dirname(__FILE__) + '/../../spec_helper'

describe "/legislacions/index.html.erb" do
  include LegislacionsHelper
  
  before(:each) do
    legislacion_98 = mock_model(Legislacion)
    legislacion_98.should_receive(:descripcion).and_return("MyString")
    legislacion_98.should_receive(:contenido).and_return("MyString")
    legislacion_98.should_receive(:archivo).and_return("MyString")
    legislacion_99 = mock_model(Legislacion)
    legislacion_99.should_receive(:descripcion).and_return("MyString")
    legislacion_99.should_receive(:contenido).and_return("MyString")
    legislacion_99.should_receive(:archivo).and_return("MyString")

    assigns[:legislacions] = [legislacion_98, legislacion_99]
  end

  it "should render list of legislacions" do
    render "/legislacions/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

