require File.dirname(__FILE__) + '/../spec_helper'

describe PartidoPolitico do
  before(:each) do
    @partido_politico = PartidoPolitico.new
  end

  it "should be valid" do
    @partido_politico.should be_valid
  end
end
