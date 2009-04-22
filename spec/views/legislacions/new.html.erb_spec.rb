require File.dirname(__FILE__) + '/../../spec_helper'

describe "/legislacions/new.html.erb" do
  include LegislacionsHelper
  
  before(:each) do
    @legislacion = mock_model(Legislacion)
    @legislacion.stub!(:new_record?).and_return(true)
    @legislacion.stub!(:descripcion).and_return("MyString")
    @legislacion.stub!(:contenido).and_return("MyString")
    @legislacion.stub!(:archivo).and_return("MyString")
    assigns[:legislacion] = @legislacion
  end

  it "should render new form" do
    render "/legislacions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", legislacions_path) do
      with_tag("input#legislacion_descripcion[name=?]", "legislacion[descripcion]")
      with_tag("input#legislacion_contenido[name=?]", "legislacion[contenido]")
      with_tag("input#legislacion_archivo[name=?]", "legislacion[archivo]")
    end
  end
end


