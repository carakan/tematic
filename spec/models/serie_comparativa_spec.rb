require File.dirname(__FILE__) + '/../spec_helper'

describe SerieComparativa do
  before(:each) do
    @serie_comparativa = SerieComparativa.new
  end

  it "should be valid" do
    @serie_comparativa.should be_valid
  end
end
