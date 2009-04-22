require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tipo_institucions/index.html.erb" do
  include TipoInstitucionsHelper
  
  before(:each) do
    tipo_institucion_98 = mock_model(TipoInstitucion)
    tipo_institucion_98.should_receive(:tipoInstitucion).and_return("MyString")
    tipo_institucion_99 = mock_model(TipoInstitucion)
    tipo_institucion_99.should_receive(:tipoInstitucion).and_return("MyString")

    assigns[:tipo_institucions] = [tipo_institucion_98, tipo_institucion_99]
  end

  it "should render list of tipo_institucions" do
    render "/tipo_institucions/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

