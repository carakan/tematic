require File.dirname(__FILE__) + '/../../spec_helper'

describe "/ministerios/new.html.erb" do
  include MinisteriosHelper
  
  before(:each) do
    @ministerio = mock_model(Ministerio)
    @ministerio.stub!(:new_record?).and_return(true)
    @ministerio.stub!(:ministerio).and_return("MyString")
    @ministerio.stub!(:responsable).and_return("MyString")
    @ministerio.stub!(:direccion).and_return("MyString")
    @ministerio.stub!(:telefono).and_return("MyString")
    @ministerio.stub!(:celular).and_return("MyString")
    @ministerio.stub!(:fax).and_return("MyString")
    @ministerio.stub!(:casilla).and_return("MyString")
    @ministerio.stub!(:email).and_return("MyString")
    @ministerio.stub!(:paginaWeb).and_return("MyString")
    assigns[:ministerio] = @ministerio
  end

  it "should render new form" do
    render "/ministerios/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", ministerios_path) do
      with_tag("input#ministerio_ministerio[name=?]", "ministerio[ministerio]")
      with_tag("input#ministerio_responsable[name=?]", "ministerio[responsable]")
      with_tag("input#ministerio_direccion[name=?]", "ministerio[direccion]")
      with_tag("input#ministerio_telefono[name=?]", "ministerio[telefono]")
      with_tag("input#ministerio_celular[name=?]", "ministerio[celular]")
      with_tag("input#ministerio_fax[name=?]", "ministerio[fax]")
      with_tag("input#ministerio_casilla[name=?]", "ministerio[casilla]")
      with_tag("input#ministerio_email[name=?]", "ministerio[email]")
      with_tag("input#ministerio_paginaWeb[name=?]", "ministerio[paginaWeb]")
    end
  end
end


