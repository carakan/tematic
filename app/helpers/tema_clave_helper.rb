module TemaClaveHelper
  def obtener_id(enlace)
    id = enlace.lactual.gsub(/\/tema_clave\/show_cronologia\//,"") 
    id = id.gsub(/\/tema_clave\/show_comparativa\//,"") 
    id = id.gsub(/\/biblioteca\/valor_noticia\//,"") 
    id = id.gsub(/\/primera_manos\//,"") 
  end
  
  def lista_enlaces(registros,url_raiz)
    cadena=""    
    for registro in registros      
      case url_raiz      
      when /show_cronologia/
        cadena+="<br/><div><span class='title2'>#{registro.fechaYear}</span> "
        cadena+="<span class='color2'>#{registro.descriptor_generico.descriptorGenerico if !registro.descriptor_generico.nil?} &gt; #{registro.descriptor_especifico.descriptorEspecifico if !registro.descriptor_especifico.nil?}</span></div>"
        cadena+="<div style='padding:0px 5px 0px 15px;text-align:justify;'><a href='#{url_raiz+registro.id.to_s}'>#{truncate(registro.hecho,100)}</a></div>"
      when /show_comparativa/
        cadena+="<br/><div><span class='title2'>#{registro.paise.pais if !registro.paise.nil?}</span> "
        cadena+="<span class='color2'>#{registro.descriptor_generico.descriptorGenerico if !registro.descriptor_generico.nil?} &gt; #{registro.descriptor_especifico.descriptorEspecifico if !registro.descriptor_especifico.nil?}</span></div>"
        cadena+="<div style='padding:0px 5px 0px 15px;text-align:justify;'><a href='#{url_raiz+registro.id.to_s}'>#{truncate(registro.hecho,100)}</a></div>"
      when /biblioteca/
        cadena+="<br/><div><span>#{registro.titulo}</span> &gt; "
        cadena+="<span style='color:#FA9A04;'>#{registro.descriptor_generico.descriptorGenerico if !registro.descriptor_generico.nil?}</span></div>"
        cadena+="<div style='padding:0px 5px 0px 15px;text-align:justify;'><a href='#{url_raiz+registro.id.to_s}'>#{truncate(registro.titulo,100)}</a></div>"
      when /primera_manos/
        cadena+="<br/><div><span style='color:#FA9A04;'>#{registro.fecha.to_s(:date)}</span><span> #{registro.titular}</span></div>"
        cadena+="<div style='padding:0px 5px 0px 15px;text-align:justify;'><a href='#{url_raiz+registro.id.to_s}'>#{truncate(registro.presentacion,100)}</a></div>"
      end
    end
    #cadena+="<strong style='color:red'>#{registros.length}</strong>"
    cadena
  end
end
