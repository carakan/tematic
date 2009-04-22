require File.dirname(__FILE__) + '/../../spec_helper'

describe "/calendarios/new.html.erb" do
  include CalendariosHelper
  
  before(:each) do
    @calendario = mock_model(Calendario)
    @calendario.stub!(:new_record?).and_return(true)
    @calendario.stub!(:fecha).and_return(Date.today)
    @calendario.stub!(:tipo).and_return("MyString")
    @calendario.stub!(:titulo).and_return("MyString")
    @calendario.stub!(:resumen).and_return("MyText")
    @calendario.stub!(:lugar).and_return("MyString")
    @calendario.stub!(:paginaWeb).and_return("MyString")
    @calendario.stub!(:email).and_return("MyString")
    assigns[:calendario] = @calendario
  end

  it "should render new form" do
    render "/calendarios/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", calendarios_path) do
      with_tag("input#calendario_tipo[name=?]", "calendario[tipo]")
      with_tag("input#calendario_titulo[name=?]", "calendario[titulo]")
      with_tag("textarea#calendario_resumen[name=?]", "calendario[resumen]")
      with_tag("input#calendario_lugar[name=?]", "calendario[lugar]")
      with_tag("input#calendario_paginaWeb[name=?]", "calendario[paginaWeb]")
      with_tag("input#calendario_email[name=?]", "calendario[email]")
    end
  end
end


