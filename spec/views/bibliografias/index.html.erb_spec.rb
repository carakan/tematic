require File.dirname(__FILE__) + '/../../spec_helper'

describe "/bibliografias/index.html.erb" do
  include BibliografiasHelper
  
  before(:each) do
    bibliografia_98 = mock_model(Bibliografia)
    bibliografia_98.should_receive(:autor).and_return("MyString")
    bibliografia_98.should_receive(:titulo).and_return("MyString")
    bibliografia_98.should_receive(:lugar).and_return("MyString")
    bibliografia_98.should_receive(:editorial).and_return("MyString")
    bibliografia_98.should_receive(:pagina).and_return("MyString")
    bibliografia_98.should_receive(:fechaYear).and_return("1")
    bibliografia_98.should_receive(:enlace).and_return("MyString")
    bibliografia_99 = mock_model(Bibliografia)
    bibliografia_99.should_receive(:autor).and_return("MyString")
    bibliografia_99.should_receive(:titulo).and_return("MyString")
    bibliografia_99.should_receive(:lugar).and_return("MyString")
    bibliografia_99.should_receive(:editorial).and_return("MyString")
    bibliografia_99.should_receive(:pagina).and_return("MyString")
    bibliografia_99.should_receive(:fechaYear).and_return("1")
    bibliografia_99.should_receive(:enlace).and_return("MyString")

    assigns[:bibliografias] = [bibliografia_98, bibliografia_99]
  end

  it "should render list of bibliografias" do
    render "/bibliografias/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

