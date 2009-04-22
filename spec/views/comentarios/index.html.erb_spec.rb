require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comentarios/index.html.erb" do
  include ComentariosHelper
  
  before(:each) do
    comentario_98 = mock_model(Comentario)
    comentario_98.should_receive(:nombre).and_return("MyString")
    comentario_98.should_receive(:email).and_return("MyString")
    comentario_98.should_receive(:mensaje).and_return("MyText")
    comentario_99 = mock_model(Comentario)
    comentario_99.should_receive(:nombre).and_return("MyString")
    comentario_99.should_receive(:email).and_return("MyString")
    comentario_99.should_receive(:mensaje).and_return("MyText")

    assigns[:comentarios] = [comentario_98, comentario_99]
  end

  it "should render list of comentarios" do
    render "/comentarios/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

