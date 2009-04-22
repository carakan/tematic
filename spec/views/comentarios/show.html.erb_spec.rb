require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comentarios/show.html.erb" do
  include ComentariosHelper
  
  before(:each) do
    @comentario = mock_model(Comentario)
    @comentario.stub!(:nombre).and_return("MyString")
    @comentario.stub!(:email).and_return("MyString")
    @comentario.stub!(:mensaje).and_return("MyText")

    assigns[:comentario] = @comentario
  end

  it "should render attributes in <p>" do
    render "/comentarios/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

