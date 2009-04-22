require File.dirname(__FILE__) + '/../spec_helper'

describe NotaDestacada do
  before(:each) do
    @nota_destacada = NotaDestacada.new
  end

  it "should be valid" do
    @nota_destacada.should be_valid
  end
end
