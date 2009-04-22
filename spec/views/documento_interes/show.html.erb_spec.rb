require File.dirname(__FILE__) + '/../../spec_helper'

describe "/documento_interes/show.html.erb" do
  include DocumentoInteresHelper
  
  before(:each) do
    @documento_intere = mock_model(DocumentoIntere)
    @documento_intere.stub!(:titulo).and_return("MyString")

    assigns[:documento_intere] = @documento_intere
  end

  it "should render attributes in <p>" do
    render "/documento_interes/show.html.erb"
    response.should have_text(/MyString/)
  end
end

