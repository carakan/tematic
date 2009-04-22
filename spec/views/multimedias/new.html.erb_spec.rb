require File.dirname(__FILE__) + '/../../spec_helper'

describe "/multimedias/new.html.erb" do
  include MultimediasHelper
  
  before(:each) do
    @multimedia = mock_model(Multimedia)
    @multimedia.stub!(:new_record?).and_return(true)
    @multimedia.stub!(:titulo).and_return("MyString")
    @multimedia.stub!(:archivo).and_return("MyString")
    assigns[:multimedia] = @multimedia
  end

  it "should render new form" do
    render "/multimedias/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", multimedias_path) do
      with_tag("input#multimedia_titulo[name=?]", "multimedia[titulo]")
      with_tag("input#multimedia_archivo[name=?]", "multimedia[archivo]")
    end
  end
end


