require File.dirname(__FILE__) + '/../../spec_helper'

describe "/ficha_tematicas/edit.html.erb" do
  include FichaTematicasHelper
  
  before do
    @ficha_tematica = mock_model(FichaTematica)
    @ficha_tematica.stub!(:autor).and_return("MyString")
    @ficha_tematica.stub!(:resumen).and_return("MyText")
    @ficha_tematica.stub!(:pagina).and_return("MyString")
    @ficha_tematica.stub!(:titulo).and_return("MyString")
    @ficha_tematica.stub!(:editorial).and_return("MyString")
    @ficha_tematica.stub!(:lugar).and_return("MyString")
    @ficha_tematica.stub!(:fechaYear).and_return("1")
    assigns[:ficha_tematica] = @ficha_tematica
  end

  it "should render edit form" do
    render "/ficha_tematicas/edit.html.erb"
    
    response.should have_tag("form[action=#{ficha_tematica_path(@ficha_tematica)}][method=post]") do
      with_tag('input#ficha_tematica_autor[name=?]', "ficha_tematica[autor]")
      with_tag('textarea#ficha_tematica_resumen[name=?]', "ficha_tematica[resumen]")
      with_tag('input#ficha_tematica_pagina[name=?]', "ficha_tematica[pagina]")
      with_tag('input#ficha_tematica_titulo[name=?]', "ficha_tematica[titulo]")
      with_tag('input#ficha_tematica_editorial[name=?]', "ficha_tematica[editorial]")
      with_tag('input#ficha_tematica_lugar[name=?]', "ficha_tematica[lugar]")
      with_tag('input#ficha_tematica_fechaYear[name=?]', "ficha_tematica[fechaYear]")
    end
  end
end


