require File.dirname(__FILE__) + '/../../spec_helper'

describe "/partido_politicos/edit.html.erb" do
  include PartidoPoliticosHelper
  
  before do
    @partido_politico = mock_model(PartidoPolitico)
    @partido_politico.stub!(:sigla).and_return("MyString")
    @partido_politico.stub!(:partidoPolitico).and_return("MyString")
    assigns[:partido_politico] = @partido_politico
  end

  it "should render edit form" do
    render "/partido_politicos/edit.html.erb"
    
    response.should have_tag("form[action=#{partido_politico_path(@partido_politico)}][method=post]") do
      with_tag('input#partido_politico_sigla[name=?]', "partido_politico[sigla]")
      with_tag('input#partido_politico_partidoPolitico[name=?]', "partido_politico[partidoPolitico]")
    end
  end
end


