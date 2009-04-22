require File.dirname(__FILE__) + '/../spec_helper'

describe PosicionActor do
  before(:each) do
    @posicion_actor = PosicionActor.new
  end

  it "should be valid" do
    @posicion_actor.should be_valid
  end
end
