require File.dirname(__FILE__) + '/../../spec_helper'

describe "/glosarios/edit.html.erb" do
  include GlosariosHelper
  
  before do
    @glosario = mock_model(Glosario)
    @glosario.stub!(:concepto).and_return("MyString")
    @glosario.stub!(:definicion).and_return("MyText")
    assigns[:glosario] = @glosario
  end

  it "should render edit form" do
    render "/glosarios/edit.html.erb"
    
    response.should have_tag("form[action=#{glosario_path(@glosario)}][method=post]") do
      with_tag('input#glosario_concepto[name=?]', "glosario[concepto]")
      with_tag('textarea#glosario_definicion[name=?]', "glosario[definicion]")
    end
  end
end


