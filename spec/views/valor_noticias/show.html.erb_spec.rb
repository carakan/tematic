require File.dirname(__FILE__) + '/../../spec_helper'

describe "/valor_noticias/show.html.erb" do
  include ValorNoticiasHelper
  
  before(:each) do
    @valor_noticia = mock_model(ValorNoticia)
    @valor_noticia.stub!(:descripcion).and_return("MyString")
    @valor_noticia.stub!(:contenido).and_return("MyText")
    @valor_noticia.stub!(:archivo).and_return("MyString")

    assigns[:valor_noticia] = @valor_noticia
  end

  it "should render attributes in <p>" do
    render "/valor_noticias/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
  end
end

