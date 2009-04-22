require File.dirname(__FILE__) + '/../../spec_helper'

describe "/glosarios/show.html.erb" do
  include GlosariosHelper
  
  before(:each) do
    @glosario = mock_model(Glosario)
    @glosario.stub!(:concepto).and_return("MyString")
    @glosario.stub!(:definicion).and_return("MyText")

    assigns[:glosario] = @glosario
  end

  it "should render attributes in <p>" do
    render "/glosarios/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

