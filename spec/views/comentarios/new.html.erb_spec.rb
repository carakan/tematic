require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comentarios/new.html.erb" do
  include ComentariosHelper
  
  before(:each) do
    @comentario = mock_model(Comentario)
    @comentario.stub!(:new_record?).and_return(true)
    @comentario.stub!(:nombre).and_return("MyString")
    @comentario.stub!(:email).and_return("MyString")
    @comentario.stub!(:mensaje).and_return("MyText")
    assigns[:comentario] = @comentario
  end

  it "should render new form" do
    render "/comentarios/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", comentarios_path) do
      with_tag("input#comentario_nombre[name=?]", "comentario[nombre]")
      with_tag("input#comentario_email[name=?]", "comentario[email]")
      with_tag("textarea#comentario_mensaje[name=?]", "comentario[mensaje]")
    end
  end
end


