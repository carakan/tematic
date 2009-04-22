require File.dirname(__FILE__) + '/../spec_helper'

describe Actor do
  before(:each) do
    @actor = Actor.new
  end

  it "should be valid" do
    @actor.should be_valid
  end
end
