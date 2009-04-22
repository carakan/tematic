require File.dirname(__FILE__) + '/../spec_helper'

describe Documento do
  before(:each) do
    @documento = Documento.new
  end

  it "should be valid" do
    @documento.should be_valid
  end
end
