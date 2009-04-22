require File.dirname(__FILE__) + '/../../spec_helper'

describe "/periodistas/show.html.erb" do
  include PeriodistasHelper
  
  before(:each) do
    @periodista = mock_model(Periodista)
    @periodista.stub!(:nombre).and_return("MyString")
    @periodista.stub!(:telefono).and_return("MyString")
    @periodista.stub!(:celular).and_return("MyString")
    @periodista.stub!(:perfil).and_return("MyText")
    @periodista.stub!(:profesion).and_return("MyText")
    @periodista.stub!(:direccion).and_return("MyText")
    @periodista.stub!(:email).and_return("MyString")

    assigns[:periodista] = @periodista
  end

  it "should render attributes in <p>" do
    render "/periodistas/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
  end
end

