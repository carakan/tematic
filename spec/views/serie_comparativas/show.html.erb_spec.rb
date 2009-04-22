require File.dirname(__FILE__) + '/../../spec_helper'

describe "/serie_comparativas/show.html.erb" do
  include SerieComparativasHelper
  
  before(:each) do
    @serie_comparativa = mock_model(SerieComparativa)
    @serie_comparativa.stub!(:hecho).and_return("MyText")
    @serie_comparativa.stub!(:contexto).and_return("MyText")
    @serie_comparativa.stub!(:gobierno).and_return("MyText")
    @serie_comparativa.stub!(:fuentes).and_return("MyText")
    @serie_comparativa.stub!(:paginaWeb).and_return("MyString")

    assigns[:serie_comparativa] = @serie_comparativa
  end

  it "should render attributes in <p>" do
    render "/serie_comparativas/show.html.erb"
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
  end
end

