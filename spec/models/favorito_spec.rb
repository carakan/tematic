require File.dirname(__FILE__) + '/../spec_helper'

describe Favorito do
  before(:each) do
    @favorito = Favorito.new
  end

  it "should be valid" do
    @favorito.should be_valid
  end
end
