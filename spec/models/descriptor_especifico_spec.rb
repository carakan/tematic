require File.dirname(__FILE__) + '/../spec_helper'

describe DescriptorEspecifico do
  before(:each) do
    @descriptor_especifico = DescriptorEspecifico.new
  end

  it "should be valid" do
    @descriptor_especifico.should be_valid
  end
end
