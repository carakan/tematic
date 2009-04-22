require File.dirname(__FILE__) + '/../../spec_helper'

describe "/asambleistas/index.html.erb" do
  include AsambleistasHelper
  
  before(:each) do
    asambleista_98 = mock_model(Asambleista)
    asambleista_98.should_receive(:nombre).and_return("MyString")
    asambleista_98.should_receive(:telefono).and_return("MyString")
    asambleista_98.should_receive(:celular).and_return("MyString")
    asambleista_98.should_receive(:email).and_return("MyString")
    asambleista_99 = mock_model(Asambleista)
    asambleista_99.should_receive(:nombre).and_return("MyString")
    asambleista_99.should_receive(:telefono).and_return("MyString")
    asambleista_99.should_receive(:celular).and_return("MyString")
    asambleista_99.should_receive(:email).and_return("MyString")

    assigns[:asambleistas] = [asambleista_98, asambleista_99]
  end

  it "should render list of asambleistas" do
    render "/asambleistas/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

