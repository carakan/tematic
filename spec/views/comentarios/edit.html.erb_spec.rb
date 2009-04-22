require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comentarios/edit.html.erb" do
  include ComentariosHelper
  
  before do
    @comentario = mock_model(Comentario)
    @comentario.stub!(:nombre).and_return("MyString")
    @comentario.stub!(:email).and_return("MyString")
    @comentario.stub!(:mensaje).and_return("MyText")
    assigns[:comentario] = @comentario
  end

  it "should render edit form" do
    render "/comentarios/edit.html.erb"
    
    response.should have_tag("form[action=#{comentario_path(@comentario)}][method=post]") do
      with_tag('input#comentario_nombre[name=?]', "comentario[nombre]")
      with_tag('input#comentario_email[name=?]', "comentario[email]")
      with_tag('textarea#comentario_mensaje[name=?]', "comentario[mensaje]")
    end
  end
end


