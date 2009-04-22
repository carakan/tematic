require File.dirname(__FILE__) + '/../spec_helper'

describe Institucion do
  before(:each) do
    @institucion = Institucion.new
  end

  it "should be valid" do
    @institucion.should be_valid
  end
end
