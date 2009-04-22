require File.dirname(__FILE__) + '/../spec_helper'

describe Especialista do
  before(:each) do
    @especialista = Especialista.new
  end

  it "should be valid" do
    @especialista.should be_valid
  end
end
