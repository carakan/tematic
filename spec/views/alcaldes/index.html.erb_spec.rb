require File.dirname(__FILE__) + '/../../spec_helper'

describe "/alcaldes/index.html.erb" do
  include AlcaldesHelper
  
  before(:each) do
    alcalde_98 = mock_model(Alcalde)
    alcalde_98.should_receive(:nombre).and_return("MyString")
    alcalde_98.should_receive(:telefono).and_return("MyString")
    alcalde_98.should_receive(:celular).and_return("MyString")
    alcalde_98.should_receive(:email).and_return("MyString")
    alcalde_98.should_receive(:paginaWeb).and_return("MyString")
    alcalde_99 = mock_model(Alcalde)
    alcalde_99.should_receive(:nombre).and_return("MyString")
    alcalde_99.should_receive(:telefono).and_return("MyString")
    alcalde_99.should_receive(:celular).and_return("MyString")
    alcalde_99.should_receive(:email).and_return("MyString")
    alcalde_99.should_receive(:paginaWeb).and_return("MyString")

    assigns[:alcaldes] = [alcalde_98, alcalde_99]
  end

  it "should render list of alcaldes" do
    render "/alcaldes/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

