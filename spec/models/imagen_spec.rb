require File.dirname(__FILE__) + '/../spec_helper'

describe Imagen do
  before(:each) do
    @imagen = Imagen.new
  end

  it "should be valid" do
    @imagen.should be_valid
  end
end
