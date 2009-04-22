require File.dirname(__FILE__) + '/../../spec_helper'

describe "/sitio/acerca" do
  before(:each) do
    render 'sitio/acerca'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', /Find me in app\/views\/sitio\/acerca/)
  end
end
