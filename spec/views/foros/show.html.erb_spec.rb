require File.dirname(__FILE__) + '/../../spec_helper'

describe "/foros/show.html.erb" do
  include ForosHelper
  
  before(:each) do
    @foro = mock_model(Foro)
    @foro.stub!(:titulo).and_return("MyString")
    @foro.stub!(:mensaje).and_return("MyText")
    @foro.stub!(:puntuacion).and_return("1")

    assigns[:foro] = @foro
  end

  it "should render attributes in <p>" do
    render "/foros/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/1/)
  end
end

