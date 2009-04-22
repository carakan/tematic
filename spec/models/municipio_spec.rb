require File.dirname(__FILE__) + '/../spec_helper'

describe Municipio do
  before(:each) do
    @municipio = Municipio.new
  end

  it "should be valid" do
    @municipio.should be_valid
  end
end
