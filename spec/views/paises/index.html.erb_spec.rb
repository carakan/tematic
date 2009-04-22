require File.dirname(__FILE__) + '/../../spec_helper'

describe "/paises/index.html.erb" do
  include PaisesHelper
  
  before(:each) do
    paise_98 = mock_model(Paise)
    paise_98.should_receive(:pais).and_return("MyString")
    paise_99 = mock_model(Paise)
    paise_99.should_receive(:pais).and_return("MyString")

    assigns[:paises] = [paise_98, paise_99]
  end

  it "should render list of paises" do
    render "/paises/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

