require File.dirname(__FILE__) + '/../spec_helper'

describe InstitucionPeriodistica do
  before(:each) do
    @institucion_periodistica = InstitucionPeriodistica.new
  end

  it "should be valid" do
    @institucion_periodistica.should be_valid
  end
end
