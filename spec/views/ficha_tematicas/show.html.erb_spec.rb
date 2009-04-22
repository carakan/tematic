require File.dirname(__FILE__) + '/../../spec_helper'

describe "/ficha_tematicas/show.html.erb" do
  include FichaTematicasHelper
  
  before(:each) do
    @ficha_tematica = mock_model(FichaTematica)
    @ficha_tematica.stub!(:autor).and_return("MyString")
    @ficha_tematica.stub!(:resumen).and_return("MyText")
    @ficha_tematica.stub!(:pagina).and_return("MyString")
    @ficha_tematica.stub!(:titulo).and_return("MyString")
    @ficha_tematica.stub!(:editorial).and_return("MyString")
    @ficha_tematica.stub!(:lugar).and_return("MyString")
    @ficha_tematica.stub!(:fechaYear).and_return("1")

    assigns[:ficha_tematica] = @ficha_tematica
  end

  it "should render attributes in <p>" do
    render "/ficha_tematicas/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/1/)
  end
end

