class MesaRedaccionController < ApplicationController
  layout 'login'
  skip_before_filter :login_required

  def honestidad
  end

  def verdad
  end

  def tipos_periodismo
  end

  def generos_periodisticos
  end

  def fuentes
  end

  def edicion_titulacion
  end
end
