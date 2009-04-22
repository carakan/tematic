require File.dirname(__FILE__) + '/../../spec_helper'

describe "/glosarios/new.html.erb" do
  include GlosariosHelper
  
  before(:each) do
    @glosario = mock_model(Glosario)
    @glosario.stub!(:new_record?).and_return(true)
    @glosario.stub!(:concepto).and_return("MyString")
    @glosario.stub!(:definicion).and_return("MyText")
    assigns[:glosario] = @glosario
  end

  it "should render new form" do
    render "/glosarios/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", glosarios_path) do
      with_tag("input#glosario_concepto[name=?]", "glosario[concepto]")
      with_tag("textarea#glosario_definicion[name=?]", "glosario[definicion]")
    end
  end
end


