class SitioController < ApplicationController
  skip_before_filter :login_required, :except => 'chat'
  def index
  end

  def acerca
  end
  
  def buscar
    render :layout => 'login'
  end
  
  def enlaces_de_interes
    render :layout => 'login'
  end
  
  def chat
    render :layout => 'login'
  end
  
  def imagenes
    @imagenes = Imagen.paginate(:per_page => 1, :page => params[:page], :order => 'created_at DESC')
    respond_to do |format|
      format.html {render :layout => 'login'}
      format.js   {}
    end
  end
  
  def boletin
    @files = Dir.glob("public/boletin/*.html")
    render :layout => 'login'
  end
end
