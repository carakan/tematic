require File.dirname(__FILE__) + '/../spec_helper'

describe DocumentoIntere do
  before(:each) do
    @documento_intere = DocumentoIntere.new
  end

  it "should be valid" do
    @documento_intere.should be_valid
  end
end
