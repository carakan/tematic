require File.dirname(__FILE__) + '/../../spec_helper'

describe "/sitio/index" do
  before(:each) do
    render 'sitio/index'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', /Find me in app\/views\/sitio\/index/)
  end
end
