require File.dirname(__FILE__) + '/../spec_helper'

describe Departamento do
  before(:each) do
    @departamento = Departamento.new
  end

  it "should be valid" do
    @departamento.should be_valid
  end
end
