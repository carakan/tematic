require File.dirname(__FILE__) + '/../../spec_helper'

describe "/alcaldes/new.html.erb" do
  include AlcaldesHelper
  
  before(:each) do
    @alcalde = mock_model(Alcalde)
    @alcalde.stub!(:new_record?).and_return(true)
    @alcalde.stub!(:nombre).and_return("MyString")
    @alcalde.stub!(:telefono).and_return("MyString")
    @alcalde.stub!(:celular).and_return("MyString")
    @alcalde.stub!(:email).and_return("MyString")
    @alcalde.stub!(:paginaWeb).and_return("MyString")
    assigns[:alcalde] = @alcalde
  end

  it "should render new form" do
    render "/alcaldes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", alcaldes_path) do
      with_tag("input#alcalde_nombre[name=?]", "alcalde[nombre]")
      with_tag("input#alcalde_telefono[name=?]", "alcalde[telefono]")
      with_tag("input#alcalde_celular[name=?]", "alcalde[celular]")
      with_tag("input#alcalde_email[name=?]", "alcalde[email]")
      with_tag("input#alcalde_paginaWeb[name=?]", "alcalde[paginaWeb]")
    end
  end
end


