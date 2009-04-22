require File.dirname(__FILE__) + '/../../spec_helper'

describe "/cargos/show.html.erb" do
  include CargosHelper
  
  before(:each) do
    @cargo = mock_model(Cargo)
    @cargo.stub!(:cargo).and_return("MyString")

    assigns[:cargo] = @cargo
  end

  it "should render attributes in <p>" do
    render "/cargos/show.html.erb"
    response.should have_text(/MyString/)
  end
end

