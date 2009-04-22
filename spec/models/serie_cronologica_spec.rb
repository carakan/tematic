require File.dirname(__FILE__) + '/../spec_helper'

describe SerieCronologica do
  before(:each) do
    @serie_cronologica = SerieCronologica.new
  end

  it "should be valid" do
    @serie_cronologica.should be_valid
  end
end
