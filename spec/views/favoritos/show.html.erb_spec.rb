require File.dirname(__FILE__) + '/../../spec_helper'

describe "/favoritos/show.html.erb" do
  include FavoritosHelper
  
  before(:each) do
    @favorito = mock_model(Favorito)
    @favorito.stub!(:titulo).and_return("MyString")
    @favorito.stub!(:enlace).and_return("MyString")

    assigns[:favorito] = @favorito
  end

  it "should render attributes in <p>" do
    render "/favoritos/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

