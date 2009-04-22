require File.dirname(__FILE__) + '/../../spec_helper'

describe "/enlace_urls/index.html.erb" do
  include EnlaceUrlsHelper
  
  before(:each) do
    enlace_url_98 = mock_model(EnlaceUrl)
    enlace_url_98.should_receive(:nombre).and_return("MyString")
    enlace_url_98.should_receive(:descripcion).and_return("MyString")
    enlace_url_98.should_receive(:url).and_return("MyString")
    enlace_url_99 = mock_model(EnlaceUrl)
    enlace_url_99.should_receive(:nombre).and_return("MyString")
    enlace_url_99.should_receive(:descripcion).and_return("MyString")
    enlace_url_99.should_receive(:url).and_return("MyString")

    assigns[:enlace_urls] = [enlace_url_98, enlace_url_99]
  end

  it "should render list of enlace_urls" do
    render "/enlace_urls/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

