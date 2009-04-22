require File.dirname(__FILE__) + '/../../spec_helper'

describe "/actors/edit.html.erb" do
  include ActorsHelper
  
  before do
    @actor = mock_model(Actor)
    @actor.stub!(:nombre).and_return("MyString")
    @actor.stub!(:urlArchivo).and_return("MyString")
    assigns[:actor] = @actor
  end

  it "should render edit form" do
    render "/actors/edit.html.erb"
    
    response.should have_tag("form[action=#{actor_path(@actor)}][method=post]") do
      with_tag('input#actor_nombre[name=?]', "actor[nombre]")
      with_tag('input#actor_urlArchivo[name=?]', "actor[urlArchivo]")
    end
  end
end


