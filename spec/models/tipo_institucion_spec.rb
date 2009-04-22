require File.dirname(__FILE__) + '/../spec_helper'

describe TipoInstitucion do
  before(:each) do
    @tipo_institucion = TipoInstitucion.new
  end

  it "should be valid" do
    @tipo_institucion.should be_valid
  end
end
