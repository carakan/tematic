require File.dirname(__FILE__) + '/../../spec_helper'

describe "/enlace_urls/show.html.erb" do
  include EnlaceUrlsHelper
  
  before(:each) do
    @enlace_url = mock_model(EnlaceUrl)
    @enlace_url.stub!(:nombre).and_return("MyString")
    @enlace_url.stub!(:descripcion).and_return("MyString")
    @enlace_url.stub!(:url).and_return("MyString")

    assigns[:enlace_url] = @enlace_url
  end

  it "should render attributes in <p>" do
    render "/enlace_urls/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

