require File.dirname(__FILE__) + '/../spec_helper'

describe Comentario do
  before(:each) do
    @comentario = Comentario.new
  end

  it "should be valid" do
    @comentario.should be_valid
  end
end
