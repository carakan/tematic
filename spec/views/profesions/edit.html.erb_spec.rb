require File.dirname(__FILE__) + '/../../spec_helper'

describe "/profesions/edit.html.erb" do
  include ProfesionsHelper
  
  before do
    @profesion = mock_model(Profesion)
    @profesion.stub!(:Profesion).and_return("MyString")
    assigns[:profesion] = @profesion
  end

  it "should render edit form" do
    render "/profesions/edit.html.erb"
    
    response.should have_tag("form[action=#{profesion_path(@profesion)}][method=post]") do
      with_tag('input#profesion_Profesion[name=?]', "profesion[Profesion]")
    end
  end
end


