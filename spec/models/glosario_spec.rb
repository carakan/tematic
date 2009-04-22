require File.dirname(__FILE__) + '/../spec_helper'

describe Glosario do
  before(:each) do
    @glosario = Glosario.new
  end

  it "should be valid" do
    @glosario.should be_valid
  end
end
