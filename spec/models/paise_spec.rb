require File.dirname(__FILE__) + '/../spec_helper'

describe Paise do
  before(:each) do
    @paise = Paise.new
  end

  it "should be valid" do
    @paise.should be_valid
  end
end
