require File.dirname(__FILE__) + '/../../spec_helper'

describe "/enlace_urls/new.html.erb" do
  include EnlaceUrlsHelper
  
  before(:each) do
    @enlace_url = mock_model(EnlaceUrl)
    @enlace_url.stub!(:new_record?).and_return(true)
    @enlace_url.stub!(:nombre).and_return("MyString")
    @enlace_url.stub!(:descripcion).and_return("MyString")
    @enlace_url.stub!(:url).and_return("MyString")
    assigns[:enlace_url] = @enlace_url
  end

  it "should render new form" do
    render "/enlace_urls/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", enlace_urls_path) do
      with_tag("input#enlace_url_nombre[name=?]", "enlace_url[nombre]")
      with_tag("input#enlace_url_descripcion[name=?]", "enlace_url[descripcion]")
      with_tag("input#enlace_url_url[name=?]", "enlace_url[url]")
    end
  end
end


