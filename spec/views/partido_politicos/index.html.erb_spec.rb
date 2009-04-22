require File.dirname(__FILE__) + '/../../spec_helper'

describe "/partido_politicos/index.html.erb" do
  include PartidoPoliticosHelper
  
  before(:each) do
    partido_politico_98 = mock_model(PartidoPolitico)
    partido_politico_98.should_receive(:sigla).and_return("MyString")
    partido_politico_98.should_receive(:partidoPolitico).and_return("MyString")
    partido_politico_99 = mock_model(PartidoPolitico)
    partido_politico_99.should_receive(:sigla).and_return("MyString")
    partido_politico_99.should_receive(:partidoPolitico).and_return("MyString")

    assigns[:partido_politicos] = [partido_politico_98, partido_politico_99]
  end

  it "should render list of partido_politicos" do
    render "/partido_politicos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

