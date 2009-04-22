require File.dirname(__FILE__) + '/../spec_helper'

describe Cargo do
  before(:each) do
    @cargo = Cargo.new
  end

  it "should be valid" do
    @cargo.should be_valid
  end
end
