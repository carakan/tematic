require File.dirname(__FILE__) + '/../../spec_helper'

describe "/profesions/show.html.erb" do
  include ProfesionsHelper
  
  before(:each) do
    @profesion = mock_model(Profesion)
    @profesion.stub!(:Profesion).and_return("MyString")

    assigns[:profesion] = @profesion
  end

  it "should render attributes in <p>" do
    render "/profesions/show.html.erb"
    response.should have_text(/MyString/)
  end
end

