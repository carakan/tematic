require File.dirname(__FILE__) + '/../../spec_helper'

describe "/actors/index.html.erb" do
  include ActorsHelper
  
  before(:each) do
    actor_98 = mock_model(Actor)
    actor_98.should_receive(:nombre).and_return("MyString")
    actor_98.should_receive(:urlArchivo).and_return("MyString")
    actor_99 = mock_model(Actor)
    actor_99.should_receive(:nombre).and_return("MyString")
    actor_99.should_receive(:urlArchivo).and_return("MyString")

    assigns[:actors] = [actor_98, actor_99]
  end

  it "should render list of actors" do
    render "/actors/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

