# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def titulo(titulo_pagina)
    content_for(:title) {titulo_pagina}
  end
  
  def pais_select
    select_tag 'pais', options_for_select(Paise.find(:all, :order => "pais").collect() { |x| [x.pais, x.idPais] })
  end
  
  def pais_select_(objeto, id)
    select(objeto, id, Paise.find(:all, :order => "pais").collect() { |x| [x.pais, x.idPais]})
  end
  
  def generico_select(objeto, id)
    select objeto, id, DescriptorGenerico.find(:all).collect() { |x| [x.descriptorGenerico, x.idDescriptorGenerico]}
  end
  
  def especifico_select(objeto, id)
    select(objeto, id, DescriptorEspecifico.find(:all).collect() { |x| [x.descriptorEspecifico, x.idDescriptorEspecifico]})
  end

  def buscar_admin_tag
    '<strong>Buscar:</strong> ' + text_field_tag(:buscar, params[:buscar], :size => 10) + ' ' + submit_tag('Buscar')
  end
  
  def buscar_generico_admin_tag
    '<strong>Buscar en:</strong> ' + select_tag('generico', options_for_select(['Todos'] + DescriptorGenerico.find(:all).collect() { |x| [x.descriptorGenerico, x.idDescriptorGenerico]})) + ' ' + text_field_tag(:buscar, params[:buscar], :size => 10) + ' ' + submit_tag('Buscar')
  end
  
  def buscar_departamento_admin_tag
    '<strong>Buscar en:</strong> ' + select_tag('departamento', options_for_select(['Todos'] + DepartamentoBolivia.find(:all).collect() { |x| [x.departamento, x.idDepartamento]})) + ' ' + text_field_tag(:buscar, params[:buscar], :size => 10) + ' ' + submit_tag('Buscar')
  end
end