require File.dirname(__FILE__) + '/../spec_helper'

describe SeriesCronologicas do
  before(:each) do
    @series_cronologicas = SeriesCronologicas.new
  end

  it "should be valid" do
    @series_cronologicas.should be_valid
  end
end
