require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tipo_institucions/edit.html.erb" do
  include TipoInstitucionsHelper
  
  before do
    @tipo_institucion = mock_model(TipoInstitucion)
    @tipo_institucion.stub!(:tipoInstitucion).and_return("MyString")
    assigns[:tipo_institucion] = @tipo_institucion
  end

  it "should render edit form" do
    render "/tipo_institucions/edit.html.erb"
    
    response.should have_tag("form[action=#{tipo_institucion_path(@tipo_institucion)}][method=post]") do
      with_tag('input#tipo_institucion_tipoInstitucion[name=?]', "tipo_institucion[tipoInstitucion]")
    end
  end
end


