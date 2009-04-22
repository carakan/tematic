require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posicion_actors/edit.html.erb" do
  include PosicionActorsHelper
  
  before do
    @posicion_actor = mock_model(PosicionActor)
    @posicion_actor.stub!(:fecha).and_return(Date.today)
    @posicion_actor.stub!(:titular).and_return("MyString")
    @posicion_actor.stub!(:posicion).and_return("MyText")
    @posicion_actor.stub!(:fuente).and_return("MyText")
    assigns[:posicion_actor] = @posicion_actor
  end

  it "should render edit form" do
    render "/posicion_actors/edit.html.erb"
    
    response.should have_tag("form[action=#{posicion_actor_path(@posicion_actor)}][method=post]") do
      with_tag('input#posicion_actor_titular[name=?]', "posicion_actor[titular]")
      with_tag('textarea#posicion_actor_posicion[name=?]', "posicion_actor[posicion]")
      with_tag('textarea#posicion_actor_fuente[name=?]', "posicion_actor[fuente]")
    end
  end
end


