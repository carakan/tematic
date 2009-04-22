# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'gettext/rails'

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem
  

  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  
  helper :all # include all helpers, all the time
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  # protect_from_forgery # :secret => 'd0e46da1171dbcc213f85ac6040dc20d'
  
  before_filter :login_required
  before_init_gettext :set_default_locale
  after_filter :set_headers
  init_gettext 'banco_tematico'
  
  # Rescatar desde una excepcion en el controlador publico
  def rescue_action_in_public(exception)
    case(exception)
    when ActiveRecord::RecordNotFound
      if !request.xhr?
        render :text => '<h3>No se encuentra el registro que busca</h3>', :layout => "login"
      else
        render :text => '<h3>No se encuentra el registro que busca</h3>', :layout => false
      end
    when NoMethodError
      if !request.xhr?
        render :text => '<h3>No se encuentra el metodo que busca</h3>', :layout => "login"
      else
        render :text => '<h3>No se encuentra el metodo que busca</h3>', :layout => false
      end
    else
      if !request.xhr?
        render :text => "<h3>El sitio no tiene la informacion pedida</h3>", :layout => "login"
      else
        render :text => "<h3>El sitio no tiene la informacion pedida</h3>", :layout => false
      end
    end
  end
  
  # Coloca los enlaces a las series cronologicas
  def colocarenlaces(serie,url_base)
    tags = Tag.find(:all)
    for tag in tags
      mylink = Enlace.find(:all, :conditions=>['lactual=? AND tag_id=?',url_base+serie.id.to_s,tag.id])
      if mylink.length > 0
        case url_base
        when /tema_clave/
          #serie.hecho   =serie.hecho.sub(/#{tag.descripcion}/i,"<a href='#{mylink[0].lsiguiente}'>#{tag.descripcion}</a>") if !serie.hecho.nil?
          serie.hecho   =serie.hecho.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.hecho.nil?
          serie.contexto=serie.contexto.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.contexto.nil?
          serie.gobierno=serie.gobierno.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.gobierno.nil?
          serie.fuentes =serie.fuentes.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.fuentes.nil?
        when /biblioteca/
          #serie.titulo     =serie.titulo.sub(/#{tag.descripcion}/i,"<a href='#{mylink[0].lsiguiente}'>#{tag.descripcion}</a>") if !serie.titulo.nil?
          serie.titulo     =serie.titulo.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.titulo.nil?
          serie.autor      =serie.autor.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.autor.nil?
          serie.descripcion=serie.descripcion.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.descripcion.nil?
        when /primera_manos/
          #serie.titular     =serie.titular.sub(/#{tag.descripcion}/i,"<a href='#{mylink[0].lsiguiente}'>#{tag.descripcion}</a>") if !serie.titular.nil?
          serie.titular     =serie.titular.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.titular.nil?
          serie.presentacion=serie.presentacion.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.presentacion.nil?
          serie.fuentes     =serie.fuentes.gsub(/#{tag.descripcion}/i,"<a href='/tema_clave/show_ocurrencias/#{tag.id}'>#{tag.descripcion}</a>") if !serie.fuentes.nil?
        end
      end
    end
  end
  
  def set_default_locale
    #set_locale settings.lang  locale = params[:lang] || cookies["lang"] || "es"
    set_locale 'es_ES'
  end 
  
  protected
  def set_headers
    headers['Expires'] = 'Thu, 27 Mar 1980 23:59:00 GMT'
    headers['Cache-Control'] = 'no-cache, must-revalidate'
    headers['Pragma'] = 'no-cache'
    headers['p3p'] = 'CP="CAO PSA OUR"'
  end
end
