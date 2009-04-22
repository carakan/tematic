require File.dirname(__FILE__) + '/../../spec_helper'

describe "/favoritos/edit.html.erb" do
  include FavoritosHelper
  
  before do
    @favorito = mock_model(Favorito)
    @favorito.stub!(:titulo).and_return("MyString")
    @favorito.stub!(:enlace).and_return("MyString")
    assigns[:favorito] = @favorito
  end

  it "should render edit form" do
    render "/favoritos/edit.html.erb"
    
    response.should have_tag("form[action=#{favorito_path(@favorito)}][method=post]") do
      with_tag('input#favorito_titulo[name=?]', "favorito[titulo]")
      with_tag('input#favorito_enlace[name=?]', "favorito[enlace]")
    end
  end
end


