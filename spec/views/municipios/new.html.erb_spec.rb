require File.dirname(__FILE__) + '/../../spec_helper'

describe "/municipios/new.html.erb" do
  include MunicipiosHelper
  
  before(:each) do
    @municipio = mock_model(Municipio)
    @municipio.stub!(:new_record?).and_return(true)
    @municipio.stub!(:municipio).and_return("MyString")
    assigns[:municipio] = @municipio
  end

  it "should render new form" do
    render "/municipios/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", municipios_path) do
      with_tag("input#municipio_municipio[name=?]", "municipio[municipio]")
    end
  end
end


