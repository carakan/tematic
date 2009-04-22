require File.dirname(__FILE__) + '/../../spec_helper'

describe "/serie_comparativas/new.html.erb" do
  include SerieComparativasHelper
  
  before(:each) do
    @serie_comparativa = mock_model(SerieComparativa)
    @serie_comparativa.stub!(:new_record?).and_return(true)
    @serie_comparativa.stub!(:hecho).and_return("MyText")
    @serie_comparativa.stub!(:contexto).and_return("MyText")
    @serie_comparativa.stub!(:gobierno).and_return("MyText")
    @serie_comparativa.stub!(:fuentes).and_return("MyText")
    @serie_comparativa.stub!(:paginaWeb).and_return("MyString")
    assigns[:serie_comparativa] = @serie_comparativa
  end

  it "should render new form" do
    render "/serie_comparativas/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", serie_comparativas_path) do
      with_tag("textarea#serie_comparativa_hecho[name=?]", "serie_comparativa[hecho]")
      with_tag("textarea#serie_comparativa_contexto[name=?]", "serie_comparativa[contexto]")
      with_tag("textarea#serie_comparativa_gobierno[name=?]", "serie_comparativa[gobierno]")
      with_tag("textarea#serie_comparativa_fuentes[name=?]", "serie_comparativa[fuentes]")
      with_tag("input#serie_comparativa_paginaWeb[name=?]", "serie_comparativa[paginaWeb]")
    end
  end
end


