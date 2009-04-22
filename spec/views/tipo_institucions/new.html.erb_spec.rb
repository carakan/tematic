require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tipo_institucions/new.html.erb" do
  include TipoInstitucionsHelper
  
  before(:each) do
    @tipo_institucion = mock_model(TipoInstitucion)
    @tipo_institucion.stub!(:new_record?).and_return(true)
    @tipo_institucion.stub!(:tipoInstitucion).and_return("MyString")
    assigns[:tipo_institucion] = @tipo_institucion
  end

  it "should render new form" do
    render "/tipo_institucions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", tipo_institucions_path) do
      with_tag("input#tipo_institucion_tipoInstitucion[name=?]", "tipo_institucion[tipoInstitucion]")
    end
  end
end


