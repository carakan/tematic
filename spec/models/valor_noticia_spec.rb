require File.dirname(__FILE__) + '/../spec_helper'

describe ValorNoticia do
  before(:each) do
    @valor_noticia = ValorNoticia.new
  end

  it "should be valid" do
    @valor_noticia.should be_valid
  end
end
