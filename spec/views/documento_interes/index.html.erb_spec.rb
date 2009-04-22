require File.dirname(__FILE__) + '/../../spec_helper'

describe "/documento_interes/index.html.erb" do
  include DocumentoInteresHelper
  
  before(:each) do
    documento_intere_98 = mock_model(DocumentoIntere)
    documento_intere_98.should_receive(:titulo).and_return("MyString")
    documento_intere_99 = mock_model(DocumentoIntere)
    documento_intere_99.should_receive(:titulo).and_return("MyString")

    assigns[:documento_interes] = [documento_intere_98, documento_intere_99]
  end

  it "should render list of documento_interes" do
    render "/documento_interes/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

