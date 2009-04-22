require File.dirname(__FILE__) + '/../../spec_helper'

describe "/documento_interes/new.html.erb" do
  include DocumentoInteresHelper
  
  before(:each) do
    @documento_intere = mock_model(DocumentoIntere)
    @documento_intere.stub!(:new_record?).and_return(true)
    @documento_intere.stub!(:titulo).and_return("MyString")
    assigns[:documento_intere] = @documento_intere
  end

  it "should render new form" do
    render "/documento_interes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", documento_interes_path) do
      with_tag("input#documento_intere_titulo[name=?]", "documento_intere[titulo]")
    end
  end
end


