require File.dirname(__FILE__) + '/../spec_helper'

describe Asambleista do
  before(:each) do
    @asambleista = Asambleista.new
  end

  it "should be valid" do
    @asambleista.should be_valid
  end
end
