require File.dirname(__FILE__) + '/../../spec_helper'

describe "/favoritos/index.html.erb" do
  include FavoritosHelper
  
  before(:each) do
    favorito_98 = mock_model(Favorito)
    favorito_98.should_receive(:titulo).and_return("MyString")
    favorito_98.should_receive(:enlace).and_return("MyString")
    favorito_99 = mock_model(Favorito)
    favorito_99.should_receive(:titulo).and_return("MyString")
    favorito_99.should_receive(:enlace).and_return("MyString")

    assigns[:favoritos] = [favorito_98, favorito_99]
  end

  it "should render list of favoritos" do
    render "/favoritos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

