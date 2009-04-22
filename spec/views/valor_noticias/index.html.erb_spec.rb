require File.dirname(__FILE__) + '/../../spec_helper'

describe "/valor_noticias/index.html.erb" do
  include ValorNoticiasHelper
  
  before(:each) do
    valor_noticia_98 = mock_model(ValorNoticia)
    valor_noticia_98.should_receive(:descripcion).and_return("MyString")
    valor_noticia_98.should_receive(:contenido).and_return("MyText")
    valor_noticia_98.should_receive(:archivo).and_return("MyString")
    valor_noticia_99 = mock_model(ValorNoticia)
    valor_noticia_99.should_receive(:descripcion).and_return("MyString")
    valor_noticia_99.should_receive(:contenido).and_return("MyText")
    valor_noticia_99.should_receive(:archivo).and_return("MyString")

    assigns[:valor_noticias] = [valor_noticia_98, valor_noticia_99]
  end

  it "should render list of valor_noticias" do
    render "/valor_noticias/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

