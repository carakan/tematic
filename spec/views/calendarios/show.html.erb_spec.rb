require File.dirname(__FILE__) + '/../../spec_helper'

describe "/calendarios/show.html.erb" do
  include CalendariosHelper
  
  before(:each) do
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

  it "should render attributes in <p>" do
    render "/calendarios/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

