require File.dirname(__FILE__) + '/../spec_helper'

describe Legislacion do
  before(:each) do
    @legislacion = Legislacion.new
  end

  it "should be valid" do
    @legislacion.should be_valid
  end
end
