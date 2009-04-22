require File.dirname(__FILE__) + '/../../spec_helper'

describe "/serie_cronologicas/edit.html.erb" do
  include SerieCronologicasHelper
  
  before do
    @serie_cronologica = mock_model(SerieCronologica)
    @serie_cronologica.stub!(:hecho).and_return("MyText")
    @serie_cronologica.stub!(:contexto).and_return("MyText")
    @serie_cronologica.stub!(:gobierno).and_return("MyText")
    @serie_cronologica.stub!(:fuentes).and_return("MyText")
    @serie_cronologica.stub!(:paginaWeb).and_return("MyString")
    assigns[:serie_cronologica] = @serie_cronologica
  end

  it "should render edit form" do
    render "/serie_cronologicas/edit.html.erb"
    
    response.should have_tag("form[action=#{serie_cronologica_path(@serie_cronologica)}][method=post]") do
      with_tag('textarea#serie_cronologica_hecho[name=?]', "serie_cronologica[hecho]")
      with_tag('textarea#serie_cronologica_contexto[name=?]', "serie_cronologica[contexto]")
      with_tag('textarea#serie_cronologica_gobierno[name=?]', "serie_cronologica[gobierno]")
      with_tag('textarea#serie_cronologica_fuentes[name=?]', "serie_cronologica[fuentes]")
      with_tag('input#serie_cronologica_paginaWeb[name=?]', "serie_cronologica[paginaWeb]")
    end
  end
end


