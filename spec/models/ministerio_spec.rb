require File.dirname(__FILE__) + '/../spec_helper'

describe Ministerio do
  before(:each) do
    @ministerio = Ministerio.new
  end

  it "should be valid" do
    @ministerio.should be_valid
  end
end
