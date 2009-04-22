require File.dirname(__FILE__) + '/../spec_helper'

describe EstadisticaUsuario do
  before(:each) do
    @estadistica_usuario = EstadisticaUsuario.new
  end

  it "should be valid" do
    @estadistica_usuario.should be_valid
  end
end
