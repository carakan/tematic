require File.dirname(__FILE__) + '/../../spec_helper'

describe "/actors/show.html.erb" do
  include ActorsHelper
  
  before(:each) do
    @actor = mock_model(Actor)
    @actor.stub!(:nombre).and_return("MyString")
    @actor.stub!(:urlArchivo).and_return("MyString")

    assigns[:actor] = @actor
  end

  it "should render attributes in <p>" do
    render "/actors/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

