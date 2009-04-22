require File.dirname(__FILE__) + '/../spec_helper'

describe Foro do
  before(:each) do
    @foro = Foro.new
  end

  it "should be valid" do
    @foro.should be_valid
  end
end
