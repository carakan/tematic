require File.dirname(__FILE__) + '/../../spec_helper'

describe "/bibliografias/edit.html.erb" do
  include BibliografiasHelper
  
  before do
    @bibliografia = mock_model(Bibliografia)
    @bibliografia.stub!(:autor).and_return("MyString")
    @bibliografia.stub!(:titulo).and_return("MyString")
    @bibliografia.stub!(:lugar).and_return("MyString")
    @bibliografia.stub!(:editorial).and_return("MyString")
    @bibliografia.stub!(:pagina).and_return("MyString")
    @bibliografia.stub!(:fechaYear).and_return("1")
    @bibliografia.stub!(:enlace).and_return("MyString")
    assigns[:bibliografia] = @bibliografia
  end

  it "should render edit form" do
    render "/bibliografias/edit.html.erb"
    
    response.should have_tag("form[action=#{bibliografia_path(@bibliografia)}][method=post]") do
      with_tag('input#bibliografia_autor[name=?]', "bibliografia[autor]")
      with_tag('input#bibliografia_titulo[name=?]', "bibliografia[titulo]")
      with_tag('input#bibliografia_lugar[name=?]', "bibliografia[lugar]")
      with_tag('input#bibliografia_editorial[name=?]', "bibliografia[editorial]")
      with_tag('input#bibliografia_pagina[name=?]', "bibliografia[pagina]")
      with_tag('input#bibliografia_fechaYear[name=?]', "bibliografia[fechaYear]")
      with_tag('input#bibliografia_enlace[name=?]', "bibliografia[enlace]")
    end
  end
end


