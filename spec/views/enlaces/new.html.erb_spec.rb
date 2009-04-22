require File.dirname(__FILE__) + '/../../spec_helper'

describe "/enlaces/new.html.erb" do
  include EnlacesHelper
  
  before(:each) do
    @enlace = mock_model(Enlace)
    @enlace.stub!(:new_record?).and_return(true)
    @enlace.stub!(:titulo).and_return("MyString")
    @enlace.stub!(:enlace).and_return("MyString")
    @enlace.stub!(:imagen).and_return("MyString")
    @enlace.stub!(:descripcion).and_return("MyString")
    @enlace.stub!(:orden).and_return("1")
    @enlace.stub!(:mostrar).and_return(false)
    assigns[:enlace] = @enlace
  end

  it "should render new form" do
    render "/enlaces/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", enlaces_path) do
      with_tag("input#enlace_titulo[name=?]", "enlace[titulo]")
      with_tag("input#enlace_enlace[name=?]", "enlace[enlace]")
      with_tag("input#enlace_imagen[name=?]", "enlace[imagen]")
      with_tag("input#enlace_descripcion[name=?]", "enlace[descripcion]")
      with_tag("input#enlace_orden[name=?]", "enlace[orden]")
      with_tag("input#enlace_mostrar[name=?]", "enlace[mostrar]")
    end
  end
end


