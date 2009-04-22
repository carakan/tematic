require File.dirname(__FILE__) + '/../../spec_helper'

describe "/bibliografias/show.html.erb" do
  include BibliografiasHelper
  
  before(:each) do
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

  it "should render attributes in <p>" do
    render "/bibliografias/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/1/)
    response.should have_text(/MyString/)
  end
end

