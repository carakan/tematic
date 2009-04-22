require File.dirname(__FILE__) + '/../../spec_helper'

describe "/serie_cronologicas/show.html.erb" do
  include SerieCronologicasHelper
  
  before(:each) do
    @serie_cronologica = mock_model(SerieCronologica)
    @serie_cronologica.stub!(:hecho).and_return("MyText")
    @serie_cronologica.stub!(:contexto).and_return("MyText")
    @serie_cronologica.stub!(:gobierno).and_return("MyText")
    @serie_cronologica.stub!(:fuentes).and_return("MyText")
    @serie_cronologica.stub!(:paginaWeb).and_return("MyString")

    assigns[:serie_cronologica] = @serie_cronologica
  end

  it "should render attributes in <p>" do
    render "/serie_cronologicas/show.html.erb"
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
  end
end

