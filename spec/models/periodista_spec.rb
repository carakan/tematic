require File.dirname(__FILE__) + '/../spec_helper'

describe Periodista do
  before(:each) do
    @periodista = Periodista.new
  end

  it "should be valid" do
    @periodista.should be_valid
  end
end
