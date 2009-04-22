module TagsHelper
  def los_enlaces(registros,url_raiz)
    cadena=""
    for registro in registros
      cadena+="<a href='#{url_raiz+registro.id.to_s}'>#{registro.id}</a>-"
    end
    cadena+="<strong style='color:red'>#{registros.length}</strong>"
    cadena
  end
end
