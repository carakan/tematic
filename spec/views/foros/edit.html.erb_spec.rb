require File.dirname(__FILE__) + '/../../spec_helper'

describe "/foros/edit.html.erb" do
  include ForosHelper
  
  before do
    @foro = mock_model(Foro)
    @foro.stub!(:titulo).and_return("MyString")
    @foro.stub!(:mensaje).and_return("MyText")
    @foro.stub!(:puntuacion).and_return("1")
    assigns[:foro] = @foro
  end

  it "should render edit form" do
    render "/foros/edit.html.erb"
    
    response.should have_tag("form[action=#{foro_path(@foro)}][method=post]") do
      with_tag('input#foro_titulo[name=?]', "foro[titulo]")
      with_tag('textarea#foro_mensaje[name=?]', "foro[mensaje]")
      with_tag('input#foro_puntuacion[name=?]', "foro[puntuacion]")
    end
  end
end


