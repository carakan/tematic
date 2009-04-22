class Admin::ValorNoticiasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /valor_noticias
  # GET /valor_noticias.xml
  def index
      @valor_noticias = ValorNoticia.busqueda(params[:page],params[:generico], params[:buscar], 20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @valor_noticias }
    end
  end

  # GET /valor_noticias/1
  # GET /valor_noticias/1.xml
  def show
    @valor_noticia = ValorNoticia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @valor_noticia }
    end
  end

  # GET /valor_noticias/new
  # GET /valor_noticias/new.xml
  def new
    @valor_noticia = ValorNoticia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @valor_noticia }
    end
  end

  # GET /valor_noticias/1/edit
  def edit
    @valor_noticia = ValorNoticia.find(params[:id])
  end

  # POST /valor_noticias
  # POST /valor_noticias.xml
  def create
    @valor_noticia = ValorNoticia.new(params[:valor_noticia])
    
    expire_fragment Time.now.to_date.to_s
    expire_fragment '/ultimo'
    
    respond_to do |format|
      if @valor_noticia.save
        flash[:notice] = 'ValorNoticia se ha creado con exito.'
        format.html { redirect_to(admin_valor_noticias_path) }
        format.xml  { render :xml => @valor_noticia, :status => :created, :location => @valor_noticia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @valor_noticia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /valor_noticias/1
  # PUT /valor_noticias/1.xml
  def update
    @valor_noticia = ValorNoticia.find(params[:id])
    
    expire_fragment Time.now.to_date.to_s
    expire_fragment '/ultimo'
    
    respond_to do |format|
      if @valor_noticia.update_attributes(params[:valor_noticia])
        flash[:notice] = 'ValorNoticia se ha actualizado con exito.'
        format.html { redirect_to(admin_valor_noticias_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @valor_noticia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /valor_noticias/1
  # DELETE /valor_noticias/1.xml
  def destroy
    @valor_noticia = ValorNoticia.find(params[:id])
    @valor_noticia.destroy
    
    expire_fragment Time.now.to_date.to_s
    expire_fragment '/ultimo'
    
    respond_to do |format|
      format.html { redirect_to(admin_valor_noticias_path) }
      format.xml  { head :ok }
    end
  end
end
