require File.dirname(__FILE__) + '/../../spec_helper'

describe "/multimedias/edit.html.erb" do
  include MultimediasHelper
  
  before do
    @multimedia = mock_model(Multimedia)
    @multimedia.stub!(:titulo).and_return("MyString")
    @multimedia.stub!(:archivo).and_return("MyString")
    assigns[:multimedia] = @multimedia
  end

  it "should render edit form" do
    render "/multimedias/edit.html.erb"
    
    response.should have_tag("form[action=#{multimedia_path(@multimedia)}][method=post]") do
      with_tag('input#multimedia_titulo[name=?]', "multimedia[titulo]")
      with_tag('input#multimedia_archivo[name=?]', "multimedia[archivo]")
    end
  end
end


