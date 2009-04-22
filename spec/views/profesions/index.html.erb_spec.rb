require File.dirname(__FILE__) + '/../../spec_helper'

describe "/profesions/index.html.erb" do
  include ProfesionsHelper
  
  before(:each) do
    profesion_98 = mock_model(Profesion)
    profesion_98.should_receive(:Profesion).and_return("MyString")
    profesion_99 = mock_model(Profesion)
    profesion_99.should_receive(:Profesion).and_return("MyString")

    assigns[:profesions] = [profesion_98, profesion_99]
  end

  it "should render list of profesions" do
    render "/profesions/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

