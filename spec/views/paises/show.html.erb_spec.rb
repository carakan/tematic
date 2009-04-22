require File.dirname(__FILE__) + '/../../spec_helper'

describe "/paises/show.html.erb" do
  include PaisesHelper
  
  before(:each) do
    @paise = mock_model(Paise)
    @paise.stub!(:pais).and_return("MyString")

    assigns[:paise] = @paise
  end

  it "should render attributes in <p>" do
    render "/paises/show.html.erb"
    response.should have_text(/MyString/)
  end
end

