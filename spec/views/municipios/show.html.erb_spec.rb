require File.dirname(__FILE__) + '/../../spec_helper'

describe "/municipios/show.html.erb" do
  include MunicipiosHelper
  
  before(:each) do
    @municipio = mock_model(Municipio)
    @municipio.stub!(:municipio).and_return("MyString")

    assigns[:municipio] = @municipio
  end

  it "should render attributes in <p>" do
    render "/municipios/show.html.erb"
    response.should have_text(/MyString/)
  end
end

