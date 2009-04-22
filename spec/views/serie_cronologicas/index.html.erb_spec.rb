require File.dirname(__FILE__) + '/../../spec_helper'

describe "/serie_cronologicas/index.html.erb" do
  include SerieCronologicasHelper
  
  before(:each) do
    serie_cronologica_98 = mock_model(SerieCronologica)
    serie_cronologica_98.should_receive(:hecho).and_return("MyText")
    serie_cronologica_98.should_receive(:contexto).and_return("MyText")
    serie_cronologica_98.should_receive(:gobierno).and_return("MyText")
    serie_cronologica_98.should_receive(:fuentes).and_return("MyText")
    serie_cronologica_98.should_receive(:paginaWeb).and_return("MyString")
    serie_cronologica_99 = mock_model(SerieCronologica)
    serie_cronologica_99.should_receive(:hecho).and_return("MyText")
    serie_cronologica_99.should_receive(:contexto).and_return("MyText")
    serie_cronologica_99.should_receive(:gobierno).and_return("MyText")
    serie_cronologica_99.should_receive(:fuentes).and_return("MyText")
    serie_cronologica_99.should_receive(:paginaWeb).and_return("MyString")

    assigns[:serie_cronologicas] = [serie_cronologica_98, serie_cronologica_99]
  end

  it "should render list of serie_cronologicas" do
    render "/serie_cronologicas/index.html.erb"
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

