require File.dirname(__FILE__) + '/../../spec_helper'

describe "/favoritos/new.html.erb" do
  include FavoritosHelper
  
  before(:each) do
    @favorito = mock_model(Favorito)
    @favorito.stub!(:new_record?).and_return(true)
    @favorito.stub!(:titulo).and_return("MyString")
    @favorito.stub!(:enlace).and_return("MyString")
    assigns[:favorito] = @favorito
  end

  it "should render new form" do
    render "/favoritos/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", favoritos_path) do
      with_tag("input#favorito_titulo[name=?]", "favorito[titulo]")
      with_tag("input#favorito_enlace[name=?]", "favorito[enlace]")
    end
  end
end


