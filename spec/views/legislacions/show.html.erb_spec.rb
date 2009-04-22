require File.dirname(__FILE__) + '/../../spec_helper'

describe "/legislacions/show.html.erb" do
  include LegislacionsHelper
  
  before(:each) do
    @legislacion = mock_model(Legislacion)
    @legislacion.stub!(:descripcion).and_return("MyString")
    @legislacion.stub!(:contenido).and_return("MyString")
    @legislacion.stub!(:archivo).and_return("MyString")

    assigns[:legislacion] = @legislacion
  end

  it "should render attributes in <p>" do
    render "/legislacions/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

