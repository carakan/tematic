require File.dirname(__FILE__) + '/../spec_helper'

describe Bibliografia do
  before(:each) do
    @bibliografia = Bibliografia.new
  end

  it "should be valid" do
    @bibliografia.should be_valid
  end
end
