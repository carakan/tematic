require File.dirname(__FILE__) + '/../../spec_helper'

describe "/municipios/edit.html.erb" do
  include MunicipiosHelper
  
  before do
    @municipio = mock_model(Municipio)
    @municipio.stub!(:municipio).and_return("MyString")
    assigns[:municipio] = @municipio
  end

  it "should render edit form" do
    render "/municipios/edit.html.erb"
    
    response.should have_tag("form[action=#{municipio_path(@municipio)}][method=post]") do
      with_tag('input#municipio_municipio[name=?]', "municipio[municipio]")
    end
  end
end


