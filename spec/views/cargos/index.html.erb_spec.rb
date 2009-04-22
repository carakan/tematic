require File.dirname(__FILE__) + '/../../spec_helper'

describe "/cargos/index.html.erb" do
  include CargosHelper
  
  before(:each) do
    cargo_98 = mock_model(Cargo)
    cargo_98.should_receive(:cargo).and_return("MyString")
    cargo_99 = mock_model(Cargo)
    cargo_99.should_receive(:cargo).and_return("MyString")

    assigns[:cargos] = [cargo_98, cargo_99]
  end

  it "should render list of cargos" do
    render "/cargos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

