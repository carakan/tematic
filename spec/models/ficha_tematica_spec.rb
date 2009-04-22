require File.dirname(__FILE__) + '/../spec_helper'

describe FichaTematica do
  before(:each) do
    @ficha_tematica = FichaTematica.new
  end

  it "should be valid" do
    @ficha_tematica.should be_valid
  end
end
