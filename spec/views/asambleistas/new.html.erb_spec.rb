require File.dirname(__FILE__) + '/../../spec_helper'

describe "/asambleistas/new.html.erb" do
  include AsambleistasHelper
  
  before(:each) do
    @asambleista = mock_model(Asambleista)
    @asambleista.stub!(:new_record?).and_return(true)
    @asambleista.stub!(:nombre).and_return("MyString")
    @asambleista.stub!(:telefono).and_return("MyString")
    @asambleista.stub!(:celular).and_return("MyString")
    @asambleista.stub!(:email).and_return("MyString")
    assigns[:asambleista] = @asambleista
  end

  it "should render new form" do
    render "/asambleistas/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", asambleistas_path) do
      with_tag("input#asambleista_nombre[name=?]", "asambleista[nombre]")
      with_tag("input#asambleista_telefono[name=?]", "asambleista[telefono]")
      with_tag("input#asambleista_celular[name=?]", "asambleista[celular]")
      with_tag("input#asambleista_email[name=?]", "asambleista[email]")
    end
  end
end


