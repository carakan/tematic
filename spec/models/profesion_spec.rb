require File.dirname(__FILE__) + '/../spec_helper'

describe Profesion do
  before(:each) do
    @profesion = Profesion.new
  end

  it "should be valid" do
    @profesion.should be_valid
  end
end
