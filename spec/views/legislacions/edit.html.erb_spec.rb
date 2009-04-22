require File.dirname(__FILE__) + '/../../spec_helper'

describe "/legislacions/edit.html.erb" do
  include LegislacionsHelper
  
  before do
    @legislacion = mock_model(Legislacion)
    @legislacion.stub!(:descripcion).and_return("MyString")
    @legislacion.stub!(:contenido).and_return("MyString")
    @legislacion.stub!(:archivo).and_return("MyString")
    assigns[:legislacion] = @legislacion
  end

  it "should render edit form" do
    render "/legislacions/edit.html.erb"
    
    response.should have_tag("form[action=#{legislacion_path(@legislacion)}][method=post]") do
      with_tag('input#legislacion_descripcion[name=?]', "legislacion[descripcion]")
      with_tag('input#legislacion_contenido[name=?]', "legislacion[contenido]")
      with_tag('input#legislacion_archivo[name=?]', "legislacion[archivo]")
    end
  end
end


