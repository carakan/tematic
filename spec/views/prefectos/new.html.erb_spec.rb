require File.dirname(__FILE__) + '/../../spec_helper'

describe "/prefectos/new.html.erb" do
  include PrefectosHelper
  
  before(:each) do
    @prefecto = mock_model(Prefecto)
    @prefecto.stub!(:new_record?).and_return(true)
    @prefecto.stub!(:nombre).and_return("MyString")
    @prefecto.stub!(:telefono).and_return("MyString")
    @prefecto.stub!(:celular).and_return("MyString")
    @prefecto.stub!(:fax).and_return("MyString")
    @prefecto.stub!(:direccion).and_return("MyString")
    @prefecto.stub!(:email).and_return("MyString")
    @prefecto.stub!(:paginaWeb).and_return("MyString")
    assigns[:prefecto] = @prefecto
  end

  it "should render new form" do
    render "/prefectos/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", prefectos_path) do
      with_tag("input#prefecto_nombre[name=?]", "prefecto[nombre]")
      with_tag("input#prefecto_telefono[name=?]", "prefecto[telefono]")
      with_tag("input#prefecto_celular[name=?]", "prefecto[celular]")
      with_tag("input#prefecto_fax[name=?]", "prefecto[fax]")
      with_tag("input#prefecto_direccion[name=?]", "prefecto[direccion]")
      with_tag("input#prefecto_email[name=?]", "prefecto[email]")
      with_tag("input#prefecto_paginaWeb[name=?]", "prefecto[paginaWeb]")
    end
  end
end


