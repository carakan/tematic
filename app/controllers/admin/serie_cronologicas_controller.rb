class Admin::SerieCronologicasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /serie_cronologicas
  # GET /serie_cronologicas.xml
  def index
    unless params[:busqueda].blank?      
      @serie_cronologicas = SerieCronologica.paginate(:per_page => 20, :page => params[:page], :order => 'fechaYear DESC', :conditions => ['fechaYear like ? OR hecho like ? OR contexto like ? OR gobierno like ? OR fuentes like ?', '%'+params[:busqueda]+'%', '%'+params[:busqueda]+'%', '%'+params[:busqueda]+'%', '%'+params[:busqueda]+'%', '%'+params[:busqueda]+'%'])
    else
      @serie_cronologicas = SerieCronologica.paginate(:per_page => 20, :page => params[:page], :order => 'fechaYear DESC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @serie_cronologicas }
    end
  end

  # GET /serie_cronologicas/1
  # GET /serie_cronologicas/1.xml
  def show
    @serie_cronologica = SerieCronologica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @serie_cronologica }
    end
  end

  # GET /serie_cronologicas/new
  # GET /serie_cronologicas/new.xml
  def new
    @serie_cronologica = SerieCronologica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => admin_serie_cronologica_path }
    end
  end

  # GET /serie_cronologicas/1/edit
  def edit
    @serie_cronologica = SerieCronologica.find(params[:id])
  end

  # POST /serie_cronologicas
  # POST /serie_cronologicas.xml
  def create
    @serie_cronologica = SerieCronologica.new(params[:serie_cronologica])
   
    respond_to do |format|
      if @serie_cronologica.save
        flash[:notice] = 'Serie cronol&oacute;gica creada correctamente.'
        format.html { redirect_to(admin_serie_cronologicas_url) }
        format.xml  { render :xml => @serie_cronologica, :status => :created, :location => @serie_cronologica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @serie_cronologica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /serie_cronologicas/1
  # PUT /serie_cronologicas/1.xml
  def update
    @serie_cronologica = SerieCronologica.find(params[:id])

    respond_to do |format|
      if @serie_cronologica.update_attributes(params[:serie_cronologica])
        flash[:notice] = 'Serie cronológica actualizada correctamente.'
        format.html { redirect_to(admin_serie_cronologicas_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @serie_cronologica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /serie_cronologicas/1
  # DELETE /serie_cronologicas/1.xml
  def destroy
    @serie_cronologica = SerieCronologica.find(params[:id])
    @serie_cronologica.destroy

    respond_to do |format|
      format.html { redirect_to(admin_serie_cronologicas_url) }
      format.xml  { head :ok }
    end
  end
  
  # Realiza wl cambio  
  def cambio

  end
  
  # Coloca los enlaces a las series cronologicas
  def colocarenlaces(serie)
    tags = Tag.find(:all)
    
    for tag in tags
      mylink = Enlace.find(:all, :conditions=>['lactual=?','/tema_clave/show_cronologia/'+serie.id.to_s])
      if mylink.length > 0
        serie.hecho   =serie.hecho.gsub(/#{tag.descripcion}/i,"<a href='#{mylink[0].lsiguiente}'>#{tag.descripcion}</a>")
        serie.contexto=serie.contexto.gsub(/#{tag.descripcion}/i,"<a href='#{mylink[0].lsiguiente}'>#{tag.descripcion}</a>")
        serie.gobierno=serie.gobierno.gsub(/#{tag.descripcion}/i,"<a href='#{mylink[0].lsiguiente}'>#{tag.descripcion}</a>")
        serie.fuentes =serie.fuentes.gsub(/#{tag.descripcion}/i,"<a href='#{mylink[0].lsiguiente}'>#{tag.descripcion}</a>")    
      end
    end
  end
  
  def busqueda
    @serie_cronologica = SerieCronologica.new
  end
  
  def btodo
    @serie = SerieCronologica.new(params[:serie_cronologica])
    @serie_cronologicas = @serie.busqueda(params[:page])
    render :action => :index
  end
end