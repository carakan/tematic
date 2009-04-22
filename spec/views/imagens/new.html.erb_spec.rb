require File.dirname(__FILE__) + '/../../spec_helper'

describe "/imagens/new.html.erb" do
  include ImagensHelper
  
  before(:each) do
    @imagen = mock_model(Imagen)
    @imagen.stub!(:new_record?).and_return(true)
    @imagen.stub!(:titulo).and_return("MyString")
    @imagen.stub!(:imagen).and_return("MyString")
    assigns[:imagen] = @imagen
  end

  it "should render new form" do
    render "/imagens/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", imagens_path) do
      with_tag("input#imagen_titulo[name=?]", "imagen[titulo]")
      with_tag("input#imagen_imagen[name=?]", "imagen[imagen]")
    end
  end
end


