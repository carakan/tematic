require File.dirname(__FILE__) + '/../../spec_helper'

describe "/partido_politicos/show.html.erb" do
  include PartidoPoliticosHelper
  
  before(:each) do
    @partido_politico = mock_model(PartidoPolitico)
    @partido_politico.stub!(:sigla).and_return("MyString")
    @partido_politico.stub!(:partidoPolitico).and_return("MyString")

    assigns[:partido_politico] = @partido_politico
  end

  it "should render attributes in <p>" do
    render "/partido_politicos/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

