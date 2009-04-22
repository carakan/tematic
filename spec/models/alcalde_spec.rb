require File.dirname(__FILE__) + '/../spec_helper'

describe Alcalde do
  before(:each) do
    @alcalde = Alcalde.new
  end

  it "should be valid" do
    @alcalde.should be_valid
  end
end
