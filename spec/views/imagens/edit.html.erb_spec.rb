require File.dirname(__FILE__) + '/../../spec_helper'

describe "/imagens/edit.html.erb" do
  include ImagensHelper
  
  before do
    @imagen = mock_model(Imagen)
    @imagen.stub!(:titulo).and_return("MyString")
    @imagen.stub!(:imagen).and_return("MyString")
    assigns[:imagen] = @imagen
  end

  it "should render edit form" do
    render "/imagens/edit.html.erb"
    
    response.should have_tag("form[action=#{imagen_path(@imagen)}][method=post]") do
      with_tag('input#imagen_titulo[name=?]', "imagen[titulo]")
      with_tag('input#imagen_imagen[name=?]', "imagen[imagen]")
    end
  end
end


