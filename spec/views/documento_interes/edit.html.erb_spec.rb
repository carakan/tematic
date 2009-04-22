require File.dirname(__FILE__) + '/../../spec_helper'

describe "/documento_interes/edit.html.erb" do
  include DocumentoInteresHelper
  
  before do
    @documento_intere = mock_model(DocumentoIntere)
    @documento_intere.stub!(:titulo).and_return("MyString")
    assigns[:documento_intere] = @documento_intere
  end

  it "should render edit form" do
    render "/documento_interes/edit.html.erb"
    
    response.should have_tag("form[action=#{documento_intere_path(@documento_intere)}][method=post]") do
      with_tag('input#documento_intere_titulo[name=?]', "documento_intere[titulo]")
    end
  end
end


