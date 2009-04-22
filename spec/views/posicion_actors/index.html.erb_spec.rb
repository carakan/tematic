require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posicion_actors/index.html.erb" do
  include PosicionActorsHelper
  
  before(:each) do
    posicion_actor_98 = mock_model(PosicionActor)
    posicion_actor_98.should_receive(:fecha).and_return(Date.today)
    posicion_actor_98.should_receive(:titular).and_return("MyString")
    posicion_actor_98.should_receive(:posicion).and_return("MyText")
    posicion_actor_98.should_receive(:fuente).and_return("MyText")
    posicion_actor_99 = mock_model(PosicionActor)
    posicion_actor_99.should_receive(:fecha).and_return(Date.today)
    posicion_actor_99.should_receive(:titular).and_return("MyString")
    posicion_actor_99.should_receive(:posicion).and_return("MyText")
    posicion_actor_99.should_receive(:fuente).and_return("MyText")

    assigns[:posicion_actors] = [posicion_actor_98, posicion_actor_99]
  end

  it "should render list of posicion_actors" do
    render "/posicion_actors/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

