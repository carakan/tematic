require File.dirname(__FILE__) + '/../spec_helper'

describe Nacion do
  before(:each) do
    @nacion = Nacion.new
  end

  it "should be valid" do
    @nacion.should be_valid
  end
end
