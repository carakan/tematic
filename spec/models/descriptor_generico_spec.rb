require File.dirname(__FILE__) + '/../spec_helper'

describe DescriptorGenerico do
  before(:each) do
    @descriptor_generico = DescriptorGenerico.new
  end

  it "should be valid" do
    @descriptor_generico.should be_valid
  end
end
