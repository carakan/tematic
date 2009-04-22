require File.dirname(__FILE__) + '/../../spec_helper'

describe "/profesions/new.html.erb" do
  include ProfesionsHelper
  
  before(:each) do
    @profesion = mock_model(Profesion)
    @profesion.stub!(:new_record?).and_return(true)
    @profesion.stub!(:Profesion).and_return("MyString")
    assigns[:profesion] = @profesion
  end

  it "should render new form" do
    render "/profesions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", profesions_path) do
      with_tag("input#profesion_Profesion[name=?]", "profesion[Profesion]")
    end
  end
end


