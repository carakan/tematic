require File.dirname(__FILE__) + '/../../spec_helper'

describe "/paises/edit.html.erb" do
  include PaisesHelper
  
  before do
    @paise = mock_model(Paise)
    @paise.stub!(:pais).and_return("MyString")
    assigns[:paise] = @paise
  end

  it "should render edit form" do
    render "/paises/edit.html.erb"
    
    response.should have_tag("form[action=#{paise_path(@paise)}][method=post]") do
      with_tag('input#paise_pais[name=?]', "paise[pais]")
    end
  end
end


