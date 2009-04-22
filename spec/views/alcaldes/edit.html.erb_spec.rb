require File.dirname(__FILE__) + '/../../spec_helper'
describe "/alcaldes/edit.html.erb" do
  include AlcaldesHelper
  
  before do
    @alcalde = mock_model(Alcalde)
    @alcalde.stub!(:nombre).and_return("MyString")
    @alcalde.stub!(:telefono).and_return("MyString")
    @alcalde.stub!(:celular).and_return("MyString")
    @alcalde.stub!(:email).and_return("MyString")
    @alcalde.stub!(:paginaWeb).and_return("MyString")
    assigns[:alcalde] = @alcalde
  end

  it "should render edit form" do
    render "/alcaldes/edit.html.erb"
    
    response.should have_tag("form[action=#{alcalde_path(@alcalde)}][method=post]") do
      with_tag('input#alcalde_nombre[name=?]', "alcalde[nombre]")
      with_tag('input#alcalde_telefono[name=?]', "alcalde[telefono]")
      with_tag('input#alcalde_celular[name=?]', "alcalde[celular]")
      with_tag('input#alcalde_email[name=?]', "alcalde[email]")
      with_tag('input#alcalde_paginaWeb[name=?]', "alcalde[paginaWeb]")
    end
  end
end


