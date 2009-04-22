class ImagenesController < ApplicationController
  layout 'login'
  skip_before_filter :login_required
 
  # GET /imagens
  # GET /imagens.xml
  def index
    @imagens = Imagen.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imagens }
    end
  end

  # GET /imagens/1
  # GET /imagens/1.xml
  def show
    @imagen = Imagen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @imagen }
    end
  end
end
