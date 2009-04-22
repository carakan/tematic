class Admin::FichaTematicasController < ApplicationController
  layout 'admin'
  require_role "administrador"
  # GET /ficha_tematicas
  # GET /ficha_tematicas.xml
  def index
    @ficha_tematicas = FichaTematica.busqueda(params[:page], params[:generico], params[:buscar])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ficha_tematicas }
    end
  end

  # GET /ficha_tematicas/1
  # GET /ficha_tematicas/1.xml
  def show
    @ficha_tematica = FichaTematica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ficha_tematica }
    end
  end

  # GET /ficha_tematicas/new
  # GET /ficha_tematicas/new.xml
  def new
    @ficha_tematica = FichaTematica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ficha_tematica }
    end
  end

  # GET /ficha_tematicas/1/edit
  def edit
    @ficha_tematica = FichaTematica.find(params[:id])
  end

  # POST /ficha_tematicas
  # POST /ficha_tematicas.xml
  def create
    @ficha_tematica = FichaTematica.new(params[:ficha_tematica])

    respond_to do |format|
      if @ficha_tematica.save
        flash[:notice] = 'FichaTematica se ha creado con exito.'
        format.html { redirect_to(admin_ficha_tematicas_url) }
        format.xml  { render :xml => @ficha_tematica, :status => :created, :location => @ficha_tematica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ficha_tematica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ficha_tematicas/1
  # PUT /ficha_tematicas/1.xml
  def update
    @ficha_tematica = FichaTematica.find(params[:id])

    respond_to do |format|
      if @ficha_tematica.update_attributes(params[:ficha_tematica])
        flash[:notice] = 'FichaTematica se ha actualizado con exito.'
        format.html { redirect_to(admin_ficha_tematicas_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ficha_tematica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ficha_tematicas/1
  # DELETE /ficha_tematicas/1.xml
  def destroy
    @ficha_tematica = FichaTematica.find(params[:id])
    @ficha_tematica.destroy

    respond_to do |format|
      format.html { redirect_to(admin_ficha_tematicas_url) }
      format.xml  { head :ok }
    end
  end
end
