require File.dirname(__FILE__) + '/../spec_helper'

describe EnlaceUrl do
  before(:each) do
    @enlace_url = EnlaceUrl.new
  end

  it "should be valid" do
    @enlace_url.should be_valid
  end
end
