require File.dirname(__FILE__) + '/../../spec_helper'

describe "/multimedias/index.html.erb" do
  include MultimediasHelper
  
  before(:each) do
    multimedia_98 = mock_model(Multimedia)
    multimedia_98.should_receive(:titulo).and_return("MyString")
    multimedia_98.should_receive(:archivo).and_return("MyString")
    multimedia_99 = mock_model(Multimedia)
    multimedia_99.should_receive(:titulo).and_return("MyString")
    multimedia_99.should_receive(:archivo).and_return("MyString")

    assigns[:multimedias] = [multimedia_98, multimedia_99]
  end

  it "should render list of multimedias" do
    render "/multimedias/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

