require File.dirname(__FILE__) + '/../spec_helper'

describe Prefecto do
  before(:each) do
    @prefecto = Prefecto.new
  end

  it "should be valid" do
    @prefecto.should be_valid
  end
end
