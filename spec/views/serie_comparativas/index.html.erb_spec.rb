require File.dirname(__FILE__) + '/../../spec_helper'

describe "/serie_comparativas/index.html.erb" do
  include SerieComparativasHelper
  
  before(:each) do
    serie_comparativa_98 = mock_model(SerieComparativa)
    serie_comparativa_98.should_receive(:hecho).and_return("MyText")
    serie_comparativa_98.should_receive(:contexto).and_return("MyText")
    serie_comparativa_98.should_receive(:gobierno).and_return("MyText")
    serie_comparativa_98.should_receive(:fuentes).and_return("MyText")
    serie_comparativa_98.should_receive(:paginaWeb).and_return("MyString")
    serie_comparativa_99 = mock_model(SerieComparativa)
    serie_comparativa_99.should_receive(:hecho).and_return("MyText")
    serie_comparativa_99.should_receive(:contexto).and_return("MyText")
    serie_comparativa_99.should_receive(:gobierno).and_return("MyText")
    serie_comparativa_99.should_receive(:fuentes).and_return("MyText")
    serie_comparativa_99.should_receive(:paginaWeb).and_return("MyString")

    assigns[:serie_comparativas] = [serie_comparativa_98, serie_comparativa_99]
  end

  it "should render list of serie_comparativas" do
    render "/serie_comparativas/index.html.erb"
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

