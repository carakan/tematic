require File.dirname(__FILE__) + '/../../spec_helper'

describe "/calendarios/index.html.erb" do
  include CalendariosHelper
  
  before(:each) do
    calendario_98 = mock_model(Calendario)
    calendario_98.should_receive(:fecha).and_return(Date.today)
    calendario_98.should_receive(:tipo).and_return("MyString")
    calendario_98.should_receive(:titulo).and_return("MyString")
    calendario_98.should_receive(:resumen).and_return("MyText")
    calendario_98.should_receive(:lugar).and_return("MyString")
    calendario_98.should_receive(:paginaWeb).and_return("MyString")
    calendario_98.should_receive(:email).and_return("MyString")
    calendario_99 = mock_model(Calendario)
    calendario_99.should_receive(:fecha).and_return(Date.today)
    calendario_99.should_receive(:tipo).and_return("MyString")
    calendario_99.should_receive(:titulo).and_return("MyString")
    calendario_99.should_receive(:resumen).and_return("MyText")
    calendario_99.should_receive(:lugar).and_return("MyString")
    calendario_99.should_receive(:paginaWeb).and_return("MyString")
    calendario_99.should_receive(:email).and_return("MyString")

    assigns[:calendarios] = [calendario_98, calendario_99]
  end

  it "should render list of calendarios" do
    render "/calendarios/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

