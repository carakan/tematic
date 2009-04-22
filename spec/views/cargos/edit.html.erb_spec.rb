require File.dirname(__FILE__) + '/../../spec_helper'

describe "/cargos/edit.html.erb" do
  include CargosHelper
  
  before do
    @cargo = mock_model(Cargo)
    @cargo.stub!(:cargo).and_return("MyString")
    assigns[:cargo] = @cargo
  end

  it "should render edit form" do
    render "/cargos/edit.html.erb"
    
    response.should have_tag("form[action=#{cargo_path(@cargo)}][method=post]") do
      with_tag('input#cargo_cargo[name=?]', "cargo[cargo]")
    end
  end
end


