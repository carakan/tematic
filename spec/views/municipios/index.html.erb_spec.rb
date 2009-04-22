require File.dirname(__FILE__) + '/../../spec_helper'

describe "/municipios/index.html.erb" do
  include MunicipiosHelper
  
  before(:each) do
    municipio_98 = mock_model(Municipio)
    municipio_98.should_receive(:municipio).and_return("MyString")
    municipio_99 = mock_model(Municipio)
    municipio_99.should_receive(:municipio).and_return("MyString")

    assigns[:municipios] = [municipio_98, municipio_99]
  end

  it "should render list of municipios" do
    render "/municipios/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

