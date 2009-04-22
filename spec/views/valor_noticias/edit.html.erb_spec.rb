require File.dirname(__FILE__) + '/../../spec_helper'

describe "/valor_noticias/edit.html.erb" do
  include ValorNoticiasHelper
  
  before do
    @valor_noticia = mock_model(ValorNoticia)
    @valor_noticia.stub!(:descripcion).and_return("MyString")
    @valor_noticia.stub!(:contenido).and_return("MyText")
    @valor_noticia.stub!(:archivo).and_return("MyString")
    assigns[:valor_noticia] = @valor_noticia
  end

  it "should render edit form" do
    render "/valor_noticias/edit.html.erb"
    
    response.should have_tag("form[action=#{valor_noticia_path(@valor_noticia)}][method=post]") do
      with_tag('input#valor_noticia_descripcion[name=?]', "valor_noticia[descripcion]")
      with_tag('textarea#valor_noticia_contenido[name=?]', "valor_noticia[contenido]")
      with_tag('input#valor_noticia_archivo[name=?]', "valor_noticia[archivo]")
    end
  end
end


