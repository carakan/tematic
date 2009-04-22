require File.dirname(__FILE__) + '/../../spec_helper'

describe "/foros/new.html.erb" do
  include ForosHelper
  
  before(:each) do
    @foro = mock_model(Foro)
    @foro.stub!(:new_record?).and_return(true)
    @foro.stub!(:titulo).and_return("MyString")
    @foro.stub!(:mensaje).and_return("MyText")
    @foro.stub!(:puntuacion).and_return("1")
    assigns[:foro] = @foro
  end

  it "should render new form" do
    render "/foros/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", foros_path) do
      with_tag("input#foro_titulo[name=?]", "foro[titulo]")
      with_tag("textarea#foro_mensaje[name=?]", "foro[mensaje]")
      with_tag("input#foro_puntuacion[name=?]", "foro[puntuacion]")
    end
  end
end


