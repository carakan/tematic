require File.dirname(__FILE__) + '/../../spec_helper'

describe "/actors/new.html.erb" do
  include ActorsHelper
  
  before(:each) do
    @actor = mock_model(Actor)
    @actor.stub!(:new_record?).and_return(true)
    @actor.stub!(:nombre).and_return("MyString")
    @actor.stub!(:urlArchivo).and_return("MyString")
    assigns[:actor] = @actor
  end

  it "should render new form" do
    render "/actors/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", actors_path) do
      with_tag("input#actor_nombre[name=?]", "actor[nombre]")
      with_tag("input#actor_urlArchivo[name=?]", "actor[urlArchivo]")
    end
  end
end


