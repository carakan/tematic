require File.dirname(__FILE__) + '/../../spec_helper'

describe "/calendarios/edit.html.erb" do
  include CalendariosHelper
  
  before do
    @calendario = mock_model(Calendario)
    @calendario.stub!(:fecha).and_return(Date.today)
    @calendario.stub!(:tipo).and_return("MyString")
    @calendario.stub!(:titulo).and_return("MyString")
    @calendario.stub!(:resumen).and_return("MyText")
    @calendario.stub!(:lugar).and_return("MyString")
    @calendario.stub!(:paginaWeb).and_return("MyString")
    @calendario.stub!(:email).and_return("MyString")
    assigns[:calendario] = @calendario
  end

  it "should render edit form" do
    render "/calendarios/edit.html.erb"
    
    response.should have_tag("form[action=#{calendario_path(@calendario)}][method=post]") do
      with_tag('input#calendario_tipo[name=?]', "calendario[tipo]")
      with_tag('input#calendario_titulo[name=?]', "calendario[titulo]")
      with_tag('textarea#calendario_resumen[name=?]', "calendario[resumen]")
      with_tag('input#calendario_lugar[name=?]', "calendario[lugar]")
      with_tag('input#calendario_paginaWeb[name=?]', "calendario[paginaWeb]")
      with_tag('input#calendario_email[name=?]', "calendario[email]")
    end
  end
end


