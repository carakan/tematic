require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posicion_actors/show.html.erb" do
  include PosicionActorsHelper
  
  before(:each) do
    @posicion_actor = mock_model(PosicionActor)
    @posicion_actor.stub!(:fecha).and_return(Date.today)
    @posicion_actor.stub!(:titular).and_return("MyString")
    @posicion_actor.stub!(:posicion).and_return("MyText")
    @posicion_actor.stub!(:fuente).and_return("MyText")

    assigns[:posicion_actor] = @posicion_actor
  end

  it "should render attributes in <p>" do
    render "/posicion_actors/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
  end
end

