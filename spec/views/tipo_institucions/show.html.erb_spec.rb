require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tipo_institucions/show.html.erb" do
  include TipoInstitucionsHelper
  
  before(:each) do
    @tipo_institucion = mock_model(TipoInstitucion)
    @tipo_institucion.stub!(:tipoInstitucion).and_return("MyString")

    assigns[:tipo_institucion] = @tipo_institucion
  end

  it "should render attributes in <p>" do
    render "/tipo_institucions/show.html.erb"
    response.should have_text(/MyString/)
  end
end

