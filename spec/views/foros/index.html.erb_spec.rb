require File.dirname(__FILE__) + '/../../spec_helper'

describe "/foros/index.html.erb" do
  include ForosHelper
  
  before(:each) do
    foro_98 = mock_model(Foro)
    foro_98.should_receive(:titulo).and_return("MyString")
    foro_98.should_receive(:mensaje).and_return("MyText")
    foro_98.should_receive(:puntuacion).and_return("1")
    foro_99 = mock_model(Foro)
    foro_99.should_receive(:titulo).and_return("MyString")
    foro_99.should_receive(:mensaje).and_return("MyText")
    foro_99.should_receive(:puntuacion).and_return("1")

    assigns[:foros] = [foro_98, foro_99]
  end

  it "should render list of foros" do
    render "/foros/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

