require File.dirname(__FILE__) + '/../spec_helper'

describe Multimedia do
  before(:each) do
    @multimedia = Multimedia.new
  end

  it "should be valid" do
    @multimedia.should be_valid
  end
end
