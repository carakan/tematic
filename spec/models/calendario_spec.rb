require File.dirname(__FILE__) + '/../spec_helper'

describe Calendario do
  before(:each) do
    @calendario = Calendario.new
  end

  it "should be valid" do
    @calendario.should be_valid
  end
end
