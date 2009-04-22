require File.dirname(__FILE__) + '/../../spec_helper'

describe "/paises/new.html.erb" do
  include PaisesHelper
  
  before(:each) do
    @paise = mock_model(Paise)
    @paise.stub!(:new_record?).and_return(true)
    @paise.stub!(:pais).and_return("MyString")
    assigns[:paise] = @paise
  end

  it "should render new form" do
    render "/paises/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", paises_path) do
      with_tag("input#paise_pais[name=?]", "paise[pais]")
    end
  end
end


