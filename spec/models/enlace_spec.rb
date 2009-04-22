require File.dirname(__FILE__) + '/../spec_helper'

describe Enlace do
  before(:each) do
    @enlace = Enlace.new
  end

  it "should be valid" do
    @enlace.should be_valid
  end
end
