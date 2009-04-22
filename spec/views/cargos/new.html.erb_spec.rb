require File.dirname(__FILE__) + '/../../spec_helper'

describe "/cargos/new.html.erb" do
  include CargosHelper
  
  before(:each) do
    @cargo = mock_model(Cargo)
    @cargo.stub!(:new_record?).and_return(true)
    @cargo.stub!(:cargo).and_return("MyString")
    assigns[:cargo] = @cargo
  end

  it "should render new form" do
    render "/cargos/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", cargos_path) do
      with_tag("input#cargo_cargo[name=?]", "cargo[cargo]")
    end
  end
end


