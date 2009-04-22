require File.dirname(__FILE__) + '/../../spec_helper'

describe "/imagens/show.html.erb" do
  include ImagensHelper
  
  before(:each) do
    @imagen = mock_model(Imagen)
    @imagen.stub!(:titulo).and_return("MyString")
    @imagen.stub!(:imagen).and_return("MyString")

    assigns[:imagen] = @imagen
  end

  it "should render attributes in <p>" do
    render "/imagens/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

