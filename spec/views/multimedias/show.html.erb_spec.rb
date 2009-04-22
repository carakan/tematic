require File.dirname(__FILE__) + '/../../spec_helper'

describe "/multimedias/show.html.erb" do
  include MultimediasHelper
  
  before(:each) do
    @multimedia = mock_model(Multimedia)
    @multimedia.stub!(:titulo).and_return("MyString")
    @multimedia.stub!(:archivo).and_return("MyString")

    assigns[:multimedia] = @multimedia
  end

  it "should render attributes in <p>" do
    render "/multimedias/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

