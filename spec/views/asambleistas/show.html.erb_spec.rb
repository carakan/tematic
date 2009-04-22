require File.dirname(__FILE__) + '/../../spec_helper'

describe "/asambleistas/show.html.erb" do
  include AsambleistasHelper
  
  before(:each) do
    @asambleista = mock_model(Asambleista)
    @asambleista.stub!(:nombre).and_return("MyString")
    @asambleista.stub!(:telefono).and_return("MyString")
    @asambleista.stub!(:celular).and_return("MyString")
    @asambleista.stub!(:email).and_return("MyString")

    assigns[:asambleista] = @asambleista
  end

  it "should render attributes in <p>" do
    render "/asambleistas/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

